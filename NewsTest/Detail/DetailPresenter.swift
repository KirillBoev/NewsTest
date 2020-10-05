//
//  DetailPresenter.swift
//  NewsTest
//
//  Created by Kirill Boev on 03.10.2020.
//

import Foundation

protocol DetailPresenterInterface {
}

class DetailPresenter: DetailPresenterInterface {
    
    weak var viewController: DetailViewControllerInterface?
    var router: DetailRouterInterface?
    
    // MARK: - DetailPresenterInterface    
}
