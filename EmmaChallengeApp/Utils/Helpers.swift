//
//  Helpers.swift
//  EmmaChallengeApp
//
//  Created by Naveed Ahmed on 03/08/2021.
//  Copyright © 2021 Naveed Ahmed. All rights reserved.
//

import Foundation

class Helpers {
    
    class func convertDateStringToLocal(input: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = formatter.date(from: input) {
            formatter.dateFormat = "EEE, MMM dd, yyyy hh:mm a"
            return formatter.string(from: date)
        } else {
            return ""
        }
    }
    
}
