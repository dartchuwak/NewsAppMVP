//
//  Assembly.swift
//  FamousQuotes
//
//  Created by Evgenii Mikhailov on 25.02.2023.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    func configureNewsModule(router: RouterProtocol) -> UIViewController
    func configureDetailsModule(article: Article? , router: RouterProtocol) -> UIViewController
}

class ModuleBuilder: BuilderProtocol   {
    
    func configureNewsModule(router: RouterProtocol) -> UIViewController {
        let view = NewsListViewController()
        let networkManager = NetworkManagerImplementation()
        let presenter = NewsListViewPresenter(view: view, network: networkManager, router: router)
        view.presenter = presenter
        return view
    }
    
    func configureDetailsModule(article: Article?, router: RouterProtocol  ) -> UIViewController {
        let view = NewsDetailsViewController()
        let networkManager = NetworkManagerImplementation()
        let presenter = DetailsViewPresenter(view: view, networkService: networkManager, router: router, article: article )
        view.presenter = presenter
        return view
    }
}
