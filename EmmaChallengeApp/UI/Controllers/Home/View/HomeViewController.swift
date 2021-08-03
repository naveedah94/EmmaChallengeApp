//
//  HomeViewController.swift
//  EmmaChallengeApp
//
//  Created by naveed durrani on 03/08/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel!
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel.refreshEvents {
            self.collectionView.reloadData()
        }
    }
    
    func setupController() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.viewModel = HomeViewModel()
        self.viewModel.fetchNextEvents {
            self.collectionView.reloadData()
        }
    }
    
    func navigateToDetails(_ data: Event) {
        (self.tabBarController as! TabBarViewController).loadDetails(event: data)
    }

}

extension HomeViewController: EventCellProtocol {

    func addToFavourites(_ event: Event) {
        DataManager.shared.addToFavourites(event)
        self.viewModel.updateEvent(event: event)
        self.updateBadge()
    }

    func removeFromFavourites(_ event: Event) {
        DataManager.shared.removeFromFavourites(event.id ?? "")
        self.viewModel.updateEvent(event: event)
        self.updateBadge()
    }

    func updateBadge() {
        (self.tabBarController as! TabBarViewController).updateBadge()
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EventCollectionViewCell
        
        cell.delegate = self
        cell.event = self.viewModel.events[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigateToDetails(self.viewModel.events[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 110.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == self.viewModel.events.count - 5 {
            print("Reloading")
            self.viewModel.fetchNextEvents {
                self.collectionView.reloadData()
            }
        }
    }
    
}
