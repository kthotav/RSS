//
//  APIError.swift
//  RSS
//
//  Created by Karthik Personal on 2/15/19.
//  Copyright © 2019 VKT. All rights reserved.
//

struct APIError: Decodable {
    let status: String
    let code: String
    let message: String
}
