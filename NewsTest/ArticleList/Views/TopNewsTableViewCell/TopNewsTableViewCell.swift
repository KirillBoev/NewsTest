//
//  TopNewsTableViewCell.swift
//  NewsTest
//
//  Created by Kirill Boev on 04.10.2020.
//

import UIKit

protocol TopNewsTableViewCellDelegate {
    func itemDidSelect(article: ArticleViewModel)
}
class TopNewsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var delegate: TopNewsTableViewCellDelegate?
    
    @IBOutlet weak var collectionView: UICollectionView!
    var topNews: [ArticleViewModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 200, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .horizontal
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "TopArticleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopArticleCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        topNews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopArticleCollectionViewCell", for: indexPath) as! TopArticleCollectionViewCell
        cell.update(article: topNews[indexPath.row])
        return cell
    }
    func update(articles: [ArticleViewModel]) {
        topNews = articles
        collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.itemDidSelect(article: topNews[indexPath.row])
    }
}
