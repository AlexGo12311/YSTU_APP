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
}
