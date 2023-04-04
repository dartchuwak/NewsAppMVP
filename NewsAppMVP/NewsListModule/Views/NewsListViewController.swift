//
//  QuotesListViewController.swift
//  FamousQuotes
//
//  Created by Evgenii Mikhailov on 25.02.2023.
//

import Foundation
import UIKit
import SDWebImage

class NewsListViewController:UIViewController, NewsListViewControllerProtocol {
    
    var presenter: NewsListViewPresenterProtocol!
    
    private let newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News"
        view.backgroundColor = .white
        view.addSubview(newsTableView)
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "id")
        NSLayoutConstraint.activate([
            newsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor ,constant: 0),
            newsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            newsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            newsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
    
    func success() {
        newsTableView.reloadData()
    }
    
    func failure(error: Error) {
        print (error)
    }
}

extension NewsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! NewsTableViewCell
        let article = presenter.articles![indexPath.row]
        cell.postTitleLabel.text = article.description
        cell.postTitleLabel.text = article.title
        if let imageURL = article.urlToImage {
            cell.newsImageView.sd_setImage(with: URL(string: imageURL))
        }
        cell.dateLabel.text = article.publishedAt
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let article = presenter.articles?[indexPath.row] else { return }
        presenter.tapOn(article: article)
    }
    
    
}

