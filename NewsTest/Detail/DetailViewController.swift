//
//  DetailViewController.swift
//  NewsTest
//
//  Created by Kirill Boev on 03.10.2020.
//

import UIKit

protocol DetailViewControllerInterface: class {
    
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: DetailPresenterInterface?
    var viewModel = ArticleViewModel()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        DetailConfigurator.configure(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        DetailConfigurator.configure(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TitleDetailTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "TitleDetailTableViewCell")
        tableView.register(UINib(nibName: "ImageDetailTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "ImageDetailTableViewCell")
        tableView.register(UINib(nibName: "DescriptionDetailTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "DescriptionDetailTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 350
        tableView.rowHeight = UITableView.automaticDimension
        
        //dis
        tableView.reloadData()
    }
}

// MARK: - DetailViewControllerInterface

extension DetailViewController: DetailViewControllerInterface {
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleDetailTableViewCell", for: indexPath) as! TitleDetailTableViewCell
            cell.update(title: viewModel.title, date: viewModel.publishedAt)
            return cell
        }
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageDetailTableViewCell", for: indexPath) as! ImageDetailTableViewCell
            cell.update(urlToImage: viewModel.urlToImage ?? "")
            return cell
        }
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionDetailTableViewCell", for: indexPath) as! DescriptionDetailTableViewCell
            cell.update(description: viewModel.description)
            return cell
        }
        return UITableViewCell()
    }
}

