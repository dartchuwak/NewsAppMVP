//
//  Model.swift
//  FamousQuotes
//
//  Created by Evgenii Mikhailov on 26.02.2023.
//

import Foundation

struct Article: Decodable {
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
}

struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
