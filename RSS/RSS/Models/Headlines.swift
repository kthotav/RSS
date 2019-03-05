//
//  Headlines.swift
//  RSS
//
//  Created by Karthik Personal on 3/4/19.
//  Copyright © 2019 VKT. All rights reserved.
//

import Foundation

struct Headlines: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
