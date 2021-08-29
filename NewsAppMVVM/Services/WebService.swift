//
//  WebService.swift
//  NewsAppMVVM
//
//  Created by Ahmad Abdulrady on 11/07/2021.
//

import Foundation
class WebService {
    func getArticle(from url: URL, completionHandler: @escaping ([Article]?)->Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completionHandler(nil)
                print(error.localizedDescription)
            }
            if let articlesData = data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: articlesData)
                completionHandler(articleList?.articles)
                print(articleList?.articles)
        }
    }.resume()
    }
}
