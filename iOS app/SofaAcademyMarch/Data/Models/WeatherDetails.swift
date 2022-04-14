//
//  WeatherDetails.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 14.04.2022..
//

import Foundation

struct WeatherDetails: Codable {
    let timezone: String
    let sunrise: String
    let sunset: String
    let longitudeAndLatitude: String
    let parent: ParentOfCity
    
    enum CodingKeys: String, CodingKey {
            case timezone
            case sunrise = "sun_rise"
            case sunset = "sun_set"
            case longitudeAndLatitude = "latt_long"
            case parent
    }
}

struct ParentOfCity: Codable {
    let title: String
}
