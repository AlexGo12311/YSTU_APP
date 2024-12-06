//
//  APICaller.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 23.09.2024.
//

import Foundation

struct Constants {
    static let API_KEY = "ЦПИ-11"
    static let baseURL = "https://gg-api.ystuty.ru/s"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getSchedule(complition: @escaping (Result<[Item], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/schedule/v1/schedule/group/\(Constants.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(LessonsResponse.self, from: data)
                complition(.success(results.items))
            } catch {
                complition(.failure(error))
            }
        }
        
        task.resume()
        
    }
    
    func getGroupsList(completion: @escaping (Result<[GroupSection], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/schedule/v1/schedule/actual_groups?additional=false") else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let results = try JSONDecoder().decode(GroupsListResponse.self, from: data)
                let sections = results.items.compactMap { item -> GroupSection? in
                    guard let name = item.name, let groups = item.groups else { return nil }
                    return GroupSection(title: name, groups: groups)
                }
                completion(.success(sections))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
