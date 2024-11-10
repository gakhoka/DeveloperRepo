//
//  News.swift
//  Assignment 19
//
//  Created by Giorgi Gakhokidze on 30.10.24.
//

import Foundation

struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Decodable {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    var source: Source?
    
    struct Source: Decodable {
        var id: String?
        var name: String?
    }
    
}


