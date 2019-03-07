//
//  Headlines.swift
//  RSS
//
//  Created by Karthik Personal on 3/4/19.
//  Copyright © 2019 VKT. All rights reserved.
//

import Foundation
import Alamofire

struct Headlines: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}


final class HeadlinesAPI {
    private init() { }
    static let shared = HeadlinesAPI()
    var url: String = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(NEWS_API_KEY)"
    
    typealias HeadlinesResult = (Result<Headlines>) -> ()
    
    func getHeadlines(completion: @escaping HeadlinesResult) {
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
                    let headlines = try decoder.decode(Headlines.self, from: data)
                    completion(.success(headlines))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
    }
}
