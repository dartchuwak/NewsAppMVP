//
//  NetworkManager.swift
//  FamousQuotes
//
//  Created by Evgenii Mikhailov on 25.02.2023.
//

import Foundation


protocol NetworkManager {
    
    func fetchData(completion: @escaping (Result<[Article], Error>) -> ())
    
}

class NetworkManagerImplementation: NetworkManager {
    
    func fetchData(completion: @escaping (Result<[Article], Error>) -> ()) {
    
        let urlString = "https://newsapi.org/v2/everything?q=keyword&apiKey=c70c643125554893aeecc898703e50a1"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
            do {
                let data = try JSONDecoder().decode(NewsResponse.self, from: data!)
                let articles = data.articles
                completion(.success(articles))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
