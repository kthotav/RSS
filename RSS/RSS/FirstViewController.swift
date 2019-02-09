//
//  FirstViewController.swift
//  RSS
//
//  Created by Karthik Personal on 2/3/19.
//  Copyright © 2019 VKT. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadSources()
    }
    
    // MARK: - Private
    private func loadSources() {
        SourcesAPI.service.getSources { result in
            switch result {
            case .success(let sources):
                print(sources)
            case .failure(let error):
                print(error)
            }
        }
    }
}

