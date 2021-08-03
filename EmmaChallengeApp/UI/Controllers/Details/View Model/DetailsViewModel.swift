//
//  DetailsViewModel.swift
//  EmmaChallengeApp
//
//  Created by Naveed Ahmed on 03/08/2021.
//  Copyright © 2021 Naveed Ahmed. All rights reserved.
//

import Foundation

class DetailsViewModel {
    
    
    var event: Event?
    
    init(event: Event) {
        self.event = event
    }
    
    var imageUrl: URL? {
        get {
            if let images = self.event?.images, images.count > 0, let imagePath = images[0].url, let url = URL(string: imagePath) {
                return url
            } else {
                return nil
            }
        }
    }
    
    var name: String {
        get {
            return self.event?.name ?? ""
        }
    }
    
    var address: String {
        get {
            if let array = self.event?.embedded?.venues, array.count > 0 {
                let venue = array[0]
                
                let venueName = venue.name ?? ""
                let city = venue.city?.name ?? ""
                let state = venue.state?.name ?? ""
                let country = venue.country?.name ?? ""
                
                return venueName + " " + city + ", " + state + ", " + country
            } else {
                return ""
            }
        }
    }
    
    var date: String {
        get {
            if let date = self.event?.dates?.start?.dateTime {
                return Helpers.convertDateStringToLocal(input: date)
            } else {
                return ""
            }
        }
    }
    
    var isFavourite: Bool {
        get {
            return self.event?.isFavourite ?? false
        }
    }
}
