//
//  HomeViewModel.swift
//  EmmaChallengeApp
//
//  Created by naveed durrani on 03/08/2021.
//

import UIKit
import Foundation

class HomeViewModel {
            
    var events: [Event] = []
    var page: Page?
    
    func refreshEvents(completion: @escaping() -> Void) {
        if self.events.count > 0 {
            for i in 0 ... self.events.count - 1 {
                self.events[i].isFavourite = DataManager.shared.checkFavourite(events[i].id ?? "")
            }
        }
        completion()
    }
    
    func fetchNextEvents(completion: @escaping() -> Void) {
        if self.canLoadMorePages() {
            let nextIndex = self.getCurrentEventsPageIndex() + 1
            APIClient.fetchAllEvents(pageIndex: nextIndex) { (response) in
                switch response.result {
                case .success(let data):
                    if let pageData = data.page, var events = data.embedded?.events {
                        self.page = pageData
                        for i in 0 ... events.count - 1 {
                            events[i].isFavourite = DataManager.shared.checkFavourite(events[i].id ?? "")
                        }
                        self.events.append(contentsOf: events)
                    }
                    completion()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func updateEvent(event: Event) {
        if self.events.count > 0 {
            for i in 0 ... self.events.count - 1 {
                if self.events[i].id == event.id {
                    self.events[i].isFavourite = event.isFavourite
                    break
                }
            }
        }
    }
    
    func getCurrentEventsPageIndex() -> Int {
        if let page = self.page {
            return page.number ?? 1
        } else {
            return 1
        }
    }
    
    func canLoadMorePages() -> Bool {
        if let page = self.page {
            return page.totalPages ?? 1 > page.number ?? 1
        } else {
            return true
        }
    }
    
}
