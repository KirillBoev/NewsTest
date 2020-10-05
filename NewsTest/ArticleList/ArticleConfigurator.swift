//
//  ArticleCofigurator.swift
//  NewsTest
//
//  Created by Kirill Boev on 03.10.2020.
//

import Foundation

class ArticleConfigurator {
    
    static func configure(_ viewController: ArticleViewController) {
        let interactor = ArticleInteractor()
        let presenter = ArticlePresenter()
        let router = ArticleRouter()
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = viewController
    }
}
