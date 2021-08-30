//
//  ArticleVM.swift
//  NewsAppMVVM
//
//  Created by Ahmad Abdulrady on 12/07/2021.
//

import Foundation

struct ArticleVM {
    var article: Article
}

//MARK:- Initalizer
extension ArticleVM {
    init(with article: Article) {
        self.article = article
    }
}

// MARK:- Computed Properties
extension ArticleVM {
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description ?? ""
    }
}
