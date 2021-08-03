//
//  DetailsViewController.swift
//  EmmaChallengeApp
//
//  Created by Naveed Ahmed on 03/08/2021.
//  Copyright © 2021 Naveed Ahmed. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {

    var viewModel: DetailsViewModel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var favouriteIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.displayDetails()
    }
    
    func displayDetails() {
        if let url = self.viewModel.imageUrl {
            self.imageView.sd_setImage(with: url, completed: nil)
        }
        self.eventName.text = self.viewModel.name
        self.eventDate.text = self.viewModel.date
        self.eventLocation.text = self.viewModel.address
        
        if self.viewModel.isFavourite {
            self.favouriteIcon.image = UIImage(systemName: "star.fill")
        } else {
            self.favouriteIcon.image = UIImage(systemName: "star")
        }
    }
    
    @IBAction func favouriteBtnClicked(_ sender: Any) {
        if var event = self.viewModel.event {
            if self.viewModel.isFavourite {
                event.isFavourite = false
                self.removeFromFavourites(event)
                self.viewModel.event?.isFavourite = false
            } else {
                event.isFavourite = true
                self.addToFavourites(event)
                self.viewModel.event?.isFavourite = true
            }
            self.displayDetails()
        }
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addToFavourites(_ event: Event) {
        DataManager.shared.addToFavourites(event)
    }

    func removeFromFavourites(_ event: Event) {
        DataManager.shared.removeFromFavourites(event.id ?? "")
    }

}
