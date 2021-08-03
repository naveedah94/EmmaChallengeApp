//
//  EventCollectionViewCell.swift
//  EmmaChallengeApp
//
//  Created by Naveed Ahmed on 03/08/2021.
//  Copyright © 2021 Naveed Ahmed. All rights reserved.
//

import UIKit
import SDWebImage

protocol EventCellProtocol {
    func addToFavourites(_ event: Event)
    func removeFromFavourites(_ event: Event)
}

class EventCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var favouriteIcon: UIImageView!
    
    var delegate: EventCellProtocol?
    
    var event: Event? {
        didSet {
            if let images = self.event?.images, images.count > 0, let imagePath = images[0].url, let url = URL(string: imagePath) {
                self.imageView.sd_setImage(with: url, completed: nil)
            } else {
                self.imageView.image = nil
            }
            
            self.eventName.text = self.event?.name
            
            if let array = self.event?.embedded?.venues, array.count > 0 {
                let venue = array[0]
                
                let venueName = venue.name ?? ""
                let city = venue.city?.name ?? ""
                let state = venue.state?.name ?? ""
                let country = venue.country?.name ?? ""
                
                self.eventLocation.text = venueName + " " + city + ", " + state + ", " + country
            } else {
                self.eventLocation.text = ""
            }
            
            if let date = self.event?.dates?.start?.dateTime {
                self.eventDate.text = Helpers.convertDateStringToLocal(input: date)
            } else {
                self.eventDate.text = ""
            }
                        
            if self.event?.isFavourite ?? false {
                self.favouriteIcon.image = UIImage(systemName: "star.fill")
            } else {
                self.favouriteIcon.image = UIImage(systemName: "star")
            }
        }
    }
    
    @IBAction func didTapFavouritesBtn(_ sender: Any) {
        if var _ = self.event, let delegate = self.delegate {
            if self.event!.isFavourite {
                self.event!.isFavourite = false
                delegate.removeFromFavourites(self.event!)
            } else {
                self.event!.isFavourite = true
                delegate.addToFavourites(self.event!)
            }
        }
    }
}
