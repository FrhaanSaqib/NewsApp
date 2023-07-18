//
//  WebService.swift
//  NewsApp
//
//  Created by Farhan Saqib on 18/07/2023.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case decodingError
}

class WebService{
    
    func fetchNews<T: Codable>(url: URL, parse: @escaping (Data) -> T?, completion: @escaping (Result<T?, NetworkError>) -> Void){
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data, error == nil, (response as? HTTPURLResponse)?.statusCode == 200 else{
                completion(.failure(.decodingError))
                return
            }
            let result = parse(data)
            completion(.success(result))
        }.resume()
    }
}
