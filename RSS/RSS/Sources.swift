//
//  Sources.swift
//  RSS
//
//  Created by Karthik Personal on 2/8/19.
//  Copyright © 2019 VKT. All rights reserved.
//

import Foundation
import Alamofire

struct Sources: Decodable {
    let status: String
    let sources: [Source]
    
    struct Source: Decodable {
        let id: String
        let name: String
        let description: String
        let url: String
        let category: String
        let language: String
        let country: String
    }
}

final class SourcesAPI {
    
    static let service = SourcesAPI()
    
    func getSources(completion: @escaping (Result<Sources>) -> ()) {
        Alamofire.request("https://newsapi.org/v2/sources?apiKey=\(NEWS_API_KEY)").response { response in
            
            // error
            if let error = response.error {
                completion(.failure(error))
            }
            
            // data
            if let data = response.data {
                do {
                    let decoder = JSONDecoder()
                    let sources = try decoder.decode(Sources.self, from: data)
                    completion(.success(sources))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
    }
}
