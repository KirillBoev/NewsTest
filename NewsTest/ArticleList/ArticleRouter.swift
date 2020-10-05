//
//  ArticleRouter.swift
//  NewsTest
//
//  Created by Kirill Boev on 03.10.2020.
//

import UIKit

protocol ArticleRouterInterface {
    func routeToDetail(article: ArticleViewModel)
}

class ArticleRouter: ArticleRouterInterface {
    
    weak var viewController: ArticleViewController?
    
    func routeToDetail(article: ArticleViewModel) {
        let vc = UIStoryboard.init(name: "Article", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.viewModel = article
        viewController?.navigationController?.pushViewController(vc!, animated: true)
    }
}
