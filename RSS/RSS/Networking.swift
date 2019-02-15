//
//  Networking.swift
//  RSS
//
//  Created by Karthik Personal on 2/11/19.
//  Copyright © 2019 VKT. All rights reserved.
//

enum Result<Value> {
    case success(Value)
    case failure(Error)
}

enum HTTPError: Error {
    case clientError
    case serverError
}
