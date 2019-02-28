//
//  WelcomeContentViewController.swift
//  RSS
//
//  Created by Karthik Personal on 2/18/19.
//  Copyright © 2019 VKT. All rights reserved.
//

import UIKit

class WelcomeContentViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var getStartedButton: UIButton!
    
    // MARK: - Properties
    var currentIndex: Int?
    var sampleText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        designGetStartedButton()
    }

    // MARK: - Actions
    @IBAction private func getStartedButtonTapped(_ sender: UIButton) { }
    
    // MARK: - Private
    // TODO: Create a IBDesignable for UIButton
    private func designGetStartedButton() {
        getStartedButton.layer.cornerRadius = 8.0
    }

}
