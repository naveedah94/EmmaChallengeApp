//
//  TabBarViewController.swift
//  EmmaChallengeApp
//
//  Created by Naveed Ahmed on 03/08/2021.
//  Copyright © 2021 Naveed Ahmed. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.updateBadge()
    }
    
    func updateBadge() {
        self.tabBar.items?[1].badgeValue = String(DataManager.shared.getFavourites().count)
    }
    
    func loadDetails(event: Event) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        let vm = DetailsViewModel(event: event)
        controller.viewModel = vm
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }

}
