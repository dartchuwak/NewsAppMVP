//
//  QuotesListViewOutput.swift
//  FamousQuotes
//
//  Created by Evgenii Mikhailov on 25.02.2023.
//

import Foundation
import UIKit

protocol NewsListViewPresenterProtocol: AnyObject {
    init  (view: NewsListViewControllerProtocol, network: NetworkManager, router: RouterProtocol )
    func fetchData()
    var articles: [Article]? { get set }
    func tapOn(article: Article?)
}
 
