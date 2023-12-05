//
//  NetworkManager.swift
//  FollowPlus
//
//  Created by Talish George on 2/12/2023.
//

import Foundation
import UIKit

enum NetworkError: String, Error {
    case invalidData = "The data received from the server was invalid."
    case decodingError = "There was an issue with the coding keys."
    case unableToComplete = "Unbale to completed your request"
    case invalidUserName = "This username created an invliad request. Please try again."
}

class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    let cache = NSCache<NSString, UIImage>()
    
    private init() {
    }

    func getFollower(for userName: String, page: Int, completed: @escaping (Result<[Follower], NetworkError>) -> Void) {
        let endpoint = baseURL + "\(userName)/followers?per_page=100&page=\(page)"
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUserName))
            return
        }

        print("End Point =>", endpoint)
//        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
//            // Your code here
//        })

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            print("URL =>", url)
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }

            guard let data = data else {
                completed(.failure(.unableToComplete))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase

                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                print("Error occurred at line \(#line): \(error)")
                if let decodingError = error as? DecodingError {
                    switch decodingError {
                    case let .keyNotFound(key, _):
                        print("Key '\(key.stringValue)' not found:", decodingError)
                        completed(.failure(.decodingError))
                    case let .valueNotFound(type, context):
                        print("Value of type '\(type)' not found:", context.debugDescription)
                        completed(.failure(.decodingError))
                    default:
                        completed(.failure(.decodingError))
                    }
                } else {
                    completed(.failure(.invalidData))
                }
            }
        }

        task.resume()
    }
}
