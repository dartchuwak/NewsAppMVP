//
//  QuotesListPresenter.swift
//  FamousQuotes
//
//  Created by Evgenii Mikhailov on 25.02.2023.
//

import Foundation
import UIKit


class NewsListViewPresenter: NewsListViewPresenterProtocol  {
    
    
    
    
    var articles: [Article]?
    weak var view: NewsListViewControllerProtocol!
    var router: RouterProtocol?
    var networkManager: NetworkManager!
    
    required init(view: NewsListViewControllerProtocol, network: NetworkManager, router: RouterProtocol) {
        self.view = view
        self.networkManager = network
        self.router = router
        fetchData()
    }
    
    func fetchData() {
        networkManager.fetchData(completion: { [weak self]  result  in
            guard let self = self else { return  }
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self.articles = articles
                    self.view.success()
                case .failure(let error):
                    self.view.failure(error: error)
                }
            }
        })
    }
    
    func tapOn(article: Article?) {
        router?.showDetails(aritcle: article)
    }
}
