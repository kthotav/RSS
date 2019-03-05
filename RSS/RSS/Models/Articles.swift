//
//  Articles.swift
//  RSS
//
//  Created by Karthik Personal on 3/4/19.
//  Copyright © 2019 VKT. All rights reserved.
//

import Foundation

struct Article: Decodable {
    
    struct ArticleSource: Decodable {
        let id: String
        let source: String
    }
    
    let source: ArticleSource
    let author: String
    let title: String
    let description: String
    let url: URL
    let urlToImage: URL
    let publishedAt: String
    let content: String
}
