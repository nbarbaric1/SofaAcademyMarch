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
    
    func getCities(inputText: String) -> Future<[City], Error> {
        let endpoint = "https://www.metaweather.com/api/location/search/?query=" + inputText
        
        
        
        return Future { promise in
            promise(.success([City(name: endpoint)]))
        }
    }

//    func getFollowers(for username: String, completed: @escaping (Result<[Follower], CustomError>) -> Void) {
//        let endpoint: String = "https://api.github.com/users/" + "\(username.lowercased())" + "/followers"
//        print("GET: \(endpoint)")
//
//        guard let url = URL(string: endpoint) else {
////            completed(nil, "Error: URL couldn't be created!")
////            completed(.failure(.i))
//            completed(.failure(.invalidResponse))
//            return
//        }
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let _ = error {
//                completed(.failure(.invalidResponse))
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completed(.failure(.invalidResponse))
//                return
//            }
//
//            guard let data = data else {
//                completed(.failure(.invalidResponse))
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder() // JSONEncoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let followers = try decoder.decode([Follower].self, from: data) // bitno!
//                completed(.success(followers))
//            } catch {
//                completed(.failure(.invalidResponse))
////                completed(nil, error.localizedDescription)
//            }
//        }
//        task.resume()
//    }


}
