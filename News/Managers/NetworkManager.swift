//
//  NetworkManager.swift
//  News
//
//  Created by michail on 11/14/19.
//  Copyright © 2019 Michail Aksyonav. All rights reserved.
//

import UIKit

class NetworkManager {
    
     func fetchRequest(url: String, completion: @escaping (Result<NewsAPI?, Error>) -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let news = try JSONDecoder().decode(NewsAPI.self, from: data)
                completion(.success(news))
            } catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
            }.resume()
    }
    
    static func fetchImage(imageUrl: String, completion: @escaping (UIImage) -> Void) {
        
        guard let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, let image = UIImage(data: data) else { return }
            completion(image)
            
            }.resume()
    }
    
    
    
}
