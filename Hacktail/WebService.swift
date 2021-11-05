//
//  WebService.swift
//  Hacktail
//
//  Created by Midhet Sulemani on 06/11/2021.
//

import Foundation
import Keys

let key = HacktailKeys()

class WebService {
    
    enum ServiceError: Error {
        case emptyUrl
    }
    
    let headers = [
        "x-rapidapi-host": "the-cocktail-db.p.rapidapi.com",
        "x-rapidapi-key": key.aPISecretKey
    ]
    
    let baseUrl = URL(string: "https://the-cocktail-db.p.rapidapi.com/")!
    
    func searchCocktail(ingredients: [String: String], completion: @escaping (Data?, Error?) -> Void) {
        
        let urlPath = "filter.php"
        
        var request = URLRequest(url: baseUrl.appendingPathComponent(urlPath),
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        
        do {
            try encode(urlRequest: &request, with: ingredients)
        } catch {
            print("could not encode url params")
        }
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error -> Void in
            if let error = error {
                completion(nil, error)
            } else {
                completion(data, nil)
            }
        }

        dataTask.resume()
    }

    private func encode(urlRequest: inout URLRequest, with parameters: [String: Any]) throws {
        
        guard let url = urlRequest.url else { throw ServiceError.emptyUrl }
        
        if var urlComponents = URLComponents(url: url,
                                             resolvingAgainstBaseURL: false), !parameters.isEmpty {
            
            urlComponents.queryItems = [URLQueryItem]()
            
            for (key, value) in parameters {
                // Customisation for multiple param values with same url param key
                if let valueArr = value as? [Any] {
                    for eachValue in valueArr {
                        let queryItem = URLQueryItem(name: key,
                                                     value: "\(eachValue)".addingPercentEncoding(withAllowedCharacters:
                                                                                                .urlHostAllowed))
                        urlComponents.queryItems?.append(queryItem)
                    }
                } else {
                    let queryItem = URLQueryItem(name: key,
                                                 value: "\(value)".addingPercentEncoding(withAllowedCharacters:
                                                                                            .urlHostAllowed))
                    urlComponents.queryItems?.append(queryItem)
                }
            }
            urlRequest.url = urlComponents.url
        }
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
    }

    
}
