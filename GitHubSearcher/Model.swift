//
//  Model.swift
//  GitHubSearcher
//
//  Created by Scott Kerkove on 5/21/20.
//  Copyright © 2020 Scott Kerkove. All rights reserved.
//

import Foundation

struct UserWrapper: Codable {
    var total_count: Int?
    let incomplete_results: Bool
    let items: [UserModel]
}

struct UserModel: Codable{
    let login: String
    let id: Int
    let node_id: String
    let avatar_url: String
    let gravatar_id: String
    let url: String

}
    
    
struct Detail: Codable {
    var login: String?
    let avatar_url: String
    let repos_url: String
    let url: String
    let location: String?
    let email: String?
    let bio: String?
    let public_repos: Int
    let followers: Int
    let following: Int
    let created_at: String
}
