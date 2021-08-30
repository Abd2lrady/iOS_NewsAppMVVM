//
//  Article.swift
//  NewsAppMVVM
//
//  Created by Ahmad Abdulrady on 12/07/2021.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
}

