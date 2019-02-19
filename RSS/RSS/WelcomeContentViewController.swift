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
    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var label: UILabel!
    
    // MARK: - Properties
    var currentIndex: Int?
    var sampleText: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let text = sampleText {
            label.text = text
        }
        
        if let currentIndex = currentIndex {
            button.isHidden = currentIndex != 2 ? true : false
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
