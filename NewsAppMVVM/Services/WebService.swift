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
                  do {
                    let decoder = JSONDecoder()
                    let articles = try decoder.decode(ArticleList.self, from: articlesData)
                    completionHandler(articles.articles)
                    print(articles.articles)
                }  catch let DecodingError.dataCorrupted(context){
                    print(context.debugDescription)
                  } catch let DecodingError.keyNotFound(key, context) {
                    print(key, context.debugDescription)
                  }
                  catch{
                    print(error)
                  }
        }
    }.resume()
    }
}
