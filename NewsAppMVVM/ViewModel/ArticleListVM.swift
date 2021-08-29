//
//  ArticleList.swift
//  NewsAppMVVM
//
//  Created by Ahmad Abdulrady on 12/07/2021.
//

import Foundation
struct ArticleListVM {
    let articles: [Article]
}

//MARK:- Computed Properties
extension ArticleListVM {
    var numberOfSections: Int {
        return 1
    }
        
    var numberOfRows: Int {
        return articles.count
    }
}

//MARK:- Functions
extension ArticleListVM {
    func articleAtIndex(at index: Int) -> ArticleVM {
        let article = articles[index]
        return ArticleVM(with: article)
    }
}
