//
//  NewsListTVC.swift
//  NewsAppMVVM
//
//  Created by Ahmad Abdulrady on 11/07/2021.
//

import UIKit

class NewsListTVC: UITableViewController {
    private var articleListVM: ArticleListVM!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() -> Void {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=63ae9f15b56d4d4cb1c922d24e50b405")
        WebService().getArticle(from: url!) { articles in
            if let articles = articles {
                self.articleListVM = ArticleListVM(articles: articles)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return articleListVM.numberOfSections
//        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleListVM.numberOfRows
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let articleCell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? ArticleCell
        else {fatalError("cell no found")}
        let articleVM = articleListVM.articleAtIndex(at: indexPath.row)
        articleCell.titleLabel.text = articleVM.title
        articleCell.descriptionLabel.text = articleVM.description
        return articleCell
    }
}
