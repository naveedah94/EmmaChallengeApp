//
//  DataManager.swift
//  EmmaChallengeApp
//
//  Created by Naveed Ahmed on 03/08/2021.
//  Copyright © 2021 Naveed Ahmed. All rights reserved.
//

import Foundation

public class DataManager {
    static let shared = DataManager()
    
    private var favourites: [Event]?
    
    private init() {
        if let val = UserDefaults.standard.object(forKey: K.Constants.favourites) as? Data {
            self.favourites = try? PropertyListDecoder.init().decode([Event].self, from: val)
        }
    }
    
    func addToFavourites(_ event: Event) {
        if self.favourites == nil {
            self.favourites = []
        }
        self.favourites?.append(event)
        self.saveData()
    }
    
    func removeFromFavourites(_ id: String) {
        if self.favourites != nil {
            var index = -1
            for item in self.favourites! {
                index = index + 1
                if item.id == id {
                    break
                }
            }
            if index > -1 {
                self.favourites?.remove(at: index)
            }
        }
    }
    
    func checkFavourite(_ id: String) -> Bool {
        for item in self.favourites ?? [] {
            if item.id == id {
                return true
            }
        }
        return false
    }
    
    func getFavourites() -> [Event] {
        return self.favourites ?? []
    }
    
    func saveData() {
        if self.favourites != nil && self.favourites!.count > 0 {
            UserDefaults.standard.set(try? PropertyListEncoder.init().encode(self.favourites!), forKey: K.Constants.favourites)
        } else {
            UserDefaults.standard.removeObject(forKey: K.Constants.favourites)
        }
    }
}
