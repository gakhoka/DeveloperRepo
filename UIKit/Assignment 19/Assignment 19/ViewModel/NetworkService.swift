//
//  NetworkService.swift
//  Assignment 19
//
//  Created by Giorgi Gakhokidze on 30.10.24.
//

import Foundation
import UIKit

class NetworkService {
    
    func fetchData<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>)->Void) {
        if let url = URL(string: urlString) {
            let urlRequest = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                
                if let error {
                    print(error)
                }
                
                guard let response = response as? HTTPURLResponse else { return }
                
                guard  (200...299).contains(response.statusCode) else { return }
                
                guard let data else { return }
                
                do {
                    let newsData = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(newsData))
                        print("success")
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }.resume()
        }
    }
}
