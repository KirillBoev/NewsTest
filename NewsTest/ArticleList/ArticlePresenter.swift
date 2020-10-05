//
//  ArticlePresenter.swift
//  NewsTest
//
//  Created by Kirill Boev on 03.10.2020.
//

import Foundation

protocol ArticlePresenterInterface {
    func loadNews()
    func articleDidSelect(article: ArticleViewModel)
}

class ArticlePresenter: ArticlePresenterInterface {
    
    weak var viewController: ArticleViewControllerInterface?
    var interactor: ArticleInteractorInterface?
    var router: ArticleRouterInterface?
    
    // MARK: - ArticlePresenterInterface
    
    func loadNews() {
        interactor?.fetchNews(compliteon: { (response) in
            if let response = response {
                
                var topNews: [ArticleViewModel] = []
                var otherNews: [ArticleViewModel] = []
                var counter = 0
                for item in response.articles {
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                    let date = dateFormatter.date(from: item.publishedAt ?? "")
                    dateFormatter.dateFormat = "dd MM yyyy"
                    let newDate =  dateFormatter.string(from: date!)
                    let articleViewModel = ArticleViewModel(title: item.title ?? "",
                                                            description: item.description ?? "",
                                                            urlToImage: item.urlToImage,
                                                            publishedAt: newDate)
                    
                    if counter >= 10 {
                        topNews.append(articleViewModel)
                    } else {
                        otherNews.append(articleViewModel)
                    }
                    counter = counter + 1
                    
                }
                
                self.viewController?.displayNews(topNews: topNews, otherNews: otherNews)
                
            } else {
                
            }
        })
    }
    func articleDidSelect(article: ArticleViewModel) {
        router?.routeToDetail(article: article)
    }
}
