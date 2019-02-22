//
//  WelcomeViewController.swift
//  RSS
//
//  Created by Karthik Personal on 2/18/19.
//  Copyright © 2019 VKT. All rights reserved.
//

import UIKit

class WelcomeViewController: UIPageViewController {
    
    // MARK: - Properties
    private var currentIndex: Int?
    private let welcomePages: [String] = ["Hello Page 1", "Hello Page 2", "Hello Page 3"]

    
    // MARK: - View cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        guard let vc = welcomeContentViewController(index: 0) else { return }
        setViewControllers([vc],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(view.subviews)
    }
    

    // MARK: - Helpers
    private func welcomeContentViewController(index: Int) -> WelcomeContentViewController? {
        guard let sb = storyboard,
            let vc = sb.instantiateViewController(withIdentifier: "WelcomeContentVC") as? WelcomeContentViewController
            else { return nil }
        vc.sampleText = welcomePages[index]
        vc.currentIndex = index
        currentIndex = index
        return vc
    }

}

extension WelcomeViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? WelcomeContentViewController, let index = vc.currentIndex else { return nil }
        if (index + 1) < welcomePages.count {
            return welcomeContentViewController(index: index + 1)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? WelcomeContentViewController, let index = vc.currentIndex else { return nil }
        if index > 0 {
            return welcomeContentViewController(index: index - 1)
        }
        return nil
    }
}
