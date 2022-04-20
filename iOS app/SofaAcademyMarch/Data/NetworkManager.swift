//
//  NetworkManager.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 14.04.2022..
//

import Foundation
import Combine

class NetworkManger {

    static let shared = NetworkManger()

    private init () {} // create only one instance!
    
    func getCities(inputText: String) -> AnyPublisher<[City], Error> {
        
        let endpoint = "https://www.metaweather.com/api/location/search/?query=" + inputText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard let url = URL(string: endpoint) else {
            return Fail<[City], Error>(error: ApiError.wrongEndpoint)
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
                    .map(\.data)
                    .decode(type: [City].self, decoder: JSONDecoder())
                    .receive(on: DispatchQueue.main)
                    .eraseToAnyPublisher()
    }
    
    func getDetails(woeid: Int) -> AnyPublisher<WeatherDetails, Error> {
        
        let endpoint = "https://www.metaweather.com/api/location/\(woeid)"
        
        guard let url = URL(string: endpoint) else {
            return Fail<WeatherDetails, Error>(error: ApiError.wrongEndpoint)
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
                    .map(\.data)
                    .decode(type: WeatherDetails.self, decoder: JSONDecoder())
                    .receive(on: DispatchQueue.main)
                    .eraseToAnyPublisher()
    }
}

// MARK: - Github part

extension NetworkManger {
    
    func getFollowers(for username: String) -> AnyPublisher<[Follower], Error>{
        let endpoint = "https://api.github.com/users/" + "\(username.lowercased())" + "/followers"
        
        print("endpoint: \(endpoint)")
        guard let url = URL(string: endpoint) else {
            return Fail<[Follower], Error>(error: ApiError.wrongEndpoint)
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Follower].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
