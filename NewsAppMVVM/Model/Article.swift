//
//  Article.swift
//  NewsAppMVVM
//
//  Created by Ahmad Abdulrady on 12/07/2021.
//

import Foundation

struct ArticleList: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String
}

