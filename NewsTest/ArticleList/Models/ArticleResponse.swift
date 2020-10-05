//
//  ArticleResponse.swift
//  NewsTest
//
//  Created by Kirill Boev on 03.10.2020.
//

import Foundation

struct ArticleResponse: Codable {
    
    var articles: [Article]
    
}

struct Article: Codable {
    
    var title: String?
    var description: String?
    var urlToImage: String?
    var content: String?
    var publishedAt: String?
}

struct ArticleViewModel {
    
    var title = ""
    var description: String = ""
    var urlToImage: String?
    var content: String = ""
    var publishedAt: String = ""
}
