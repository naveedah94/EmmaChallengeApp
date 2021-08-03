//
//  FavouritesViewModel.swift
//  EmmaChallengeApp
//
//  Created by Naveed Ahmed on 03/08/2021.
//  Copyright © 2021 Naveed Ahmed. All rights reserved.
//

import Foundation

class FavouritesViewModel {
    
    var events: [Event] {
        get {
            return DataManager.shared.getFavourites()
        }
    }
}
