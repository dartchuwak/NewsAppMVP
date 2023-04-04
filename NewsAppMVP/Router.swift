//
//  RouterProtocol.swift
//  FamousQuotes
//
//  Created by Evgenii Mikhailov on 03.03.2023.
//

import Foundation
import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var moduleBuilder: BuilderProtocol? { get set }
}


protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetails(aritcle: Article?)
    func popToRoot()
}


class Router: RouterProtocol {
    
    
    var navigationController: UINavigationController?
    var moduleBuilder: BuilderProtocol?
    
    init(navigationController: UINavigationController, moduleBuilder: BuilderProtocol)  {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = moduleBuilder?.configureNewsModule(router: self) else { return}
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showDetails(aritcle: Article?) {
        if let navigationController = navigationController {
            guard let details = moduleBuilder?.configureDetailsModule(article: aritcle!, router: self) else { return}
            navigationController.pushViewController(details, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
   
    
    
}
