//
//  WelcomeContentViewController.swift
//  RSS
//
//  Created by Karthik Personal on 2/18/19.
//  Copyright © 2019 VKT. All rights reserved.
//

import UIKit

class WelcomeContentViewController: UIViewController {
    
    // MARK: - Properties
    var currentIndex: Int?
    var sampleText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions
    @IBAction private func getStartedButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: UDKeys.visitedWelcomeScreen.rawValue)
        UserDefaults.standard.synchronize()
    }

}
