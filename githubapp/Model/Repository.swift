//
//  Repository.swift
//  githubapp
//
//  Created by AlbertStanley on 17/10/20.
//

import Foundation

struct Repository: Codable {
    let id: Int?
    let name: String?
    let full_name: String?
    let forks: Int?
    let language: String?
    let updated_at: String?
    var updatedAtString:String {
        let formatter = ISO8601DateFormatter()
        if let updatedAt = updated_at {
            return formatter.date(from: updatedAt)!.timeAgoDisplay()
        }
        return "No data"
    }
}

typealias Repositories = [Repository]
