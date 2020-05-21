//
//  ViewModel.swift
//  GitHubSearcher
//
//  Created by Scott Kerkove on 5/21/20.
//  Copyright © 2020 Scott Kerkove. All rights reserved.
//

import Foundation
import UIKit

class ViewModel {

    
    var userSearchArray = [UserModel]()
    var error : Error?
    
    func searchFor(username: String, completion: @escaping completion) {
        let newUrl = "https://api.github.com/search/users?q=\(username)"
        ApiHandler.getDataFromServer(filteredUrl:newUrl) { (model) in
            self.userSearchArray = model
            completion(model)
            
        }
    }
    


//    func getNumberOfRows(forArray: [User])->Int {
//      return forArray.count
//    }
//
//    func getObjectAtindex(index: Int, inArray: [User])->User{
//      return inArray[index]
//    }
    
}
