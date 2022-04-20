//
//  Followers.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 20.04.2022..
//

import Foundation

struct Follower: Decodable {
    var login: String
    var avatarUrl: String
    var id: Int
    
    enum CodingKeys: String, CodingKey {
            case login
            case avatarUrl = "avatar_url"
            case id
    }
}
