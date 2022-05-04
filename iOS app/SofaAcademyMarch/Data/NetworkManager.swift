//
//  NetworkManager.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 14.04.2022..
//

import Foundation
import Combine
import UIKit

class NetworkManger {
    
    static let shared = NetworkManger()
    
    let cache = NSCache<NSString, UIImage>()
    var subs = Set<AnyCancellable>()

    
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
    
    func getInfo(username: String) -> AnyPublisher<User, Error>{
        let endpoint = "https://api.github.com/users/" + "\(username.lowercased())"
        
        print("endpoint: \(endpoint)")
        guard let url = URL(string: endpoint) else {
            return Fail<User, Error>(error: ApiError.wrongEndpoint)
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: User.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func downloadImage(from url: String) -> Future<UIImage, Error> {
        let cacheKey = NSString(string: url)
        return Future { [weak self] promise in
            guard let self = self else { return }
            if let image = self.cache.object(forKey: cacheKey) {
                promise(.success(image))
            }
            
            guard let validUrl = URL(string: url) else {
                promise(.failure(ApiError.wrongEndpoint))
                return
            }
            
            URLSession.shared.dataTaskPublisher(for: validUrl)
                    .map { UIImage(data: $0.data) }
                    .catch { error in return Just(nil) }
                    .subscribe(on: DispatchQueue.global(qos: .background))
                    .receive(on: RunLoop.main)
                    .eraseToAnyPublisher()
                    .sink { c in
                        print("c in nm: ", c)
                    } receiveValue: { image in
                        guard let image = image else { return }
                        self.cache.setObject(image, forKey: cacheKey)
                        promise(.success(image))
                    }.store(in: &self.subs)
        }
    }
}
