//
//  ArticleViewController.swift
//  NewsTest
//
//  Created by Kirill Boev on 03.10.2020.
//

import UIKit

protocol ArticleViewControllerInterface: class {
    func displayNews(topNews: [ArticleViewModel], otherNews:[ArticleViewModel])
}

class ArticleViewController: UIViewController, TopNewsTableViewCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ArticlePresenterInterface?
    
    private var topNews: [ArticleViewModel] = []
    private var otherNews: [ArticleViewModel] = []
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        ArticleConfigurator.configure(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ArticleConfigurator.configure(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TopNewsTableViewCell", bundle: nil), forCellReuseIdentifier: "TopNewsTableViewCell")
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        //dis
        tableView.reloadData()
        presenter?.loadNews()
    }
    func itemDidSelect(article: ArticleViewModel) {
        presenter?.articleDidSelect(article: article)
    }
}









// MARK: - ArticleViewControllerInterface

extension ArticleViewController: ArticleViewControllerInterface {
    func displayNews(topNews: [ArticleViewModel], otherNews: [ArticleViewModel]) {
        self.topNews = topNews
        self.otherNews = otherNews
        tableView.reloadData()
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ArticleViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return otherNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopNewsTableViewCell", for: indexPath) as! TopNewsTableViewCell
            cell.update(articles: topNews)
            cell.delegate = self
            
            
            return cell
        } else {let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
            cell.update(article: otherNews[indexPath.row])
            
            
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.articleDidSelect(article: otherNews[indexPath.row])
    }
    
}




