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
    
    // MARK: - Properties
    static let service = SourcesAPI()
    var url: String = "https://newsapi.org/v2/sources?apiKey=\(NEWS_API_KEY)"
    
    // MARK: - Public
    func getSources(completion: @escaping (Result<Sources>) -> ()) {
        Alamofire.request(url).response { response in
            
            // error
            if let error = response.error {
                completion(.failure(error))
            }
            
            // HTTP response
            if let response = response.response {
                switch response.statusCode {
                case 200...299: break
                case 400...499: completion(.failure(HTTPError.clientError))
                case 500...599: completion(.failure(HTTPError.serverError))
                default: break
                }
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
