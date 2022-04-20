//
//  GithubUser.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 21.04.2022..
//

import Foundation

struct User: Decodable {
    let login: String
    let avatarUrl: String
    let name: String?
    let publicReposCount: Int
    let publicGistsCount: Int
    let location: String?
    let description: String?
    let followersCount: Int
    let followingCount: Int
    let createdAt: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case name
        case publicReposCount = "public_repos"
        case publicGistsCount = "public_gists"
        case location
        case description = "bio"
        case followersCount = "followers"
        case followingCount = "following"
        case createdAt = "created_at"
    }
    
    func userSince() -> String? {
        // TODO: convert createdAt to date
        return createdAt
    }
}
