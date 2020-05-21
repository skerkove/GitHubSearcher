//
//  ApiHandler.swift
//  GitHubSearcher
//
//  Created by Scott Kerkove on 5/21/20.
//  Copyright © 2020 Scott Kerkove. All rights reserved.
//

import Foundation


typealias completion = (([UserModel]) -> ())
class ApiHandler {
    
    
    
    static func getDataFromServer(filteredUrl: String, completion: @escaping completion) {
        
        let url = URL(string: filteredUrl)
        guard let unwrappedUrl = url else { return }
        
        var urlRequest = URLRequest(url: unwrappedUrl)
        urlRequest.timeoutInterval = 10
        urlRequest.httpMethod = "GET"
        
        let urlSession = URLSession.shared
        urlSession.dataTask(with: urlRequest) { (data, response, error) in
            if error == nil && data != nil {
                let jsonDecoder = JSONDecoder()
                do {
                    let model = try jsonDecoder.decode(UserWrapper.self, from: data!)
                    print(model.items)
                    completion(model.items)
                } catch {
                    print(error)
                }
                
            } else {
                //make an alert
                print("not working")
            }
            
        }.resume()
        
    }
}
