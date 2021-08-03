//
//  FavouritesViewController.swift
//  EmmaChallengeApp
//
//  Created by Naveed Ahmed on 03/08/2021.
//  Copyright © 2021 Naveed Ahmed. All rights reserved.
//

import UIKit

class FavouritesViewController: UIViewController {

    var viewModel: FavouritesViewModel!
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.collectionView.reloadData()
    }
    
    func setupController() {
        self.viewModel = FavouritesViewModel()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func navigateToDetails(_ data: Event) {
        (self.tabBarController as! TabBarViewController).loadDetails(event: data)
    }

}

extension FavouritesViewController: EventCellProtocol {

    func addToFavourites(_ event: Event) {
    }

    func removeFromFavourites(_ event: Event) {
        DataManager.shared.removeFromFavourites(event.id ?? "")
        self.collectionView.reloadData()
        self.updateBadge()
    }

    func updateBadge() {
        (self.tabBarController as! TabBarViewController).updateBadge()
    }

}

extension FavouritesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 110.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigateToDetails(self.viewModel.events[indexPath.row])
    }
    
}
