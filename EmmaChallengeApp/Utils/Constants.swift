//
//  Constants.swift
//  EmmaChallengeApp
//
//  Created by naveed durrani on 03/08/2021.
//

import Foundation

private let serverUrl = "https://app.ticketmaster.com/"

struct K {
    struct ProductionServer {
        static let baseURL = serverUrl + "discovery/v2/"
    }
    
    struct APIParameterKey {
        static let apiKey = "apikey"
        static let page = "page"
        static let size = "size"
    }
    
    struct EndPoints {
        static let fetchEvents = "events.json"
    }
    
    struct Constants {
        static let apiKey = "umAwXYPOotqf5K3Ao8fAPhvGvk4UXqFW"
        static let pageSize = 30
        static let favourites = "favourites"
    }
}
