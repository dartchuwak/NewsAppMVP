//
//  QuotesDetailsViewPresenterProtocol.swift
//  FamousQuotes
//
//  Created by Evgenii Mikhailov on 03.03.2023.
//

import Foundation

protocol NewsDetailsViewPresenterProtocol: AnyObject {
    
    init ( view: NewsDetailsViewControllerProtocol, networkService: NetworkManager, router: RouterProtocol, article: Article?)
    func setArticle ()
    func tap()
}




