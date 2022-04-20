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
    
    enum CodingKeys: String, CodingKey {
            case login
            case avatarUrl = "avatar_url"
    }
}
