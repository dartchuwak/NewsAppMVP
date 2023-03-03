//
//  QuotesDetailsViewPresenter.swift
//  FamousQuotes
//
//  Created by Evgenii Mikhailov on 03.03.2023.
//

import Foundation


class DetailsViewPresenter: NewsDetailsViewPresenterProtocol {
    
    
    
    weak var view: NewsDetailsViewControllerProtocol?
    let networkService: NetworkManager!
    var article: Article?
    let router: RouterProtocol?
    
    required init(view: NewsDetailsViewControllerProtocol, networkService: NetworkManager,router: RouterProtocol, article: Article?) {
        self.view = view
        self.networkService = networkService
        self.article = article
        self.router = router
    }
    
    public func setArticle() {
        self.view?.setArticle(article: article)
    }
    
    func tap() {
        router?.popToRoot()
    }
    
    
}
