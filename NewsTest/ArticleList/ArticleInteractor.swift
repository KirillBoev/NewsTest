//
//  ArticleInteractor.swift
//  NewsTest
//
//  Created by Kirill Boev on 03.10.2020.
//

import Foundation

protocol ArticleInteractorInterface {
    func fetchNews(compliteon: @escaping (ArticleResponse?) -> Void)
}

class ArticleInteractor: ArticleInteractorInterface {
    
    // MARK: - ArticleInteractorInterface
    
    func fetchNews(compliteon: @escaping (ArticleResponse?) -> Void){
        
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=aaedc2be589441dc8cc89d980c6db572"
        let url = URL (string: urlString)
        let session = URLSession (configuration: .default)
        let task = session.dataTask(with: url!) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    do {
                        let decoded = try decoder.decode(ArticleResponse.self, from: data)
                        compliteon(decoded)
                    } catch {
                        print("DECODING ERROR: \(error)")
                        compliteon(nil)
                    }
                }else {
                    compliteon(nil)
                }
            }
        }
        task.resume()
    }
}
