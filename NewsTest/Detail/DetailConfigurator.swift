//
//  DetailConfigurator.swift
//  NewsTest
//
//  Created by Kirill Boev on 03.10.2020.
//

import Foundation

class DetailConfigurator {
    
    static func configure(_ viewController: DetailViewController) {
        let presenter = DetailPresenter()
        let router = DetailRouter()
        
        viewController.presenter = presenter
        
        presenter.viewController = viewController
        presenter.router = router        
    }
}


