//
//  User.swift
//  githubapp
//
//  Created by AlbertStanley on 17/10/20.
//

import Foundation


struct User: Codable {
    let id: Int
    let login: String
    let node_id: String
    let avatar_url: String
    let repos_url: String
    let followers_url: String
    let url: String
    let following: Int?
    let followers: Int?
    let name: String?
}
typealias Users = [User]
