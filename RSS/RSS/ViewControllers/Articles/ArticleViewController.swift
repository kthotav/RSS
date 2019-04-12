//
//  ArticleViewController.swift
//  RSS
//
//  Created by Karthik on 4/9/19.
//  Copyright © 2019 VKT. All rights reserved.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController {
    
    // MARK: - Properties
    var articleURL: String!
    
    // MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /* TO DO: Content blocking
        guard let jsonFilePath = Bundle.main.path(forResource: "blockerList", ofType: "json") else { return }
        guard let jsonFileContent = try? String(contentsOfFile: jsonFilePath, encoding: .utf8) else { return }
        
        WKContentRuleListStore.default()?.compileContentRuleList(forIdentifier: "blockList", encodedContentRuleList: jsonFileContent, completionHandler: { (contentRuleList, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            if let list = contentRuleList {
                self.webView.configuration.userContentController.add(list)
                let url = URL(string: self.articleURL)!
                self.webView.load(URLRequest(url: url))
            }
        })
        */
        
        let url = URL(string: self.articleURL)!
        self.webView.load(URLRequest(url: url))


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
