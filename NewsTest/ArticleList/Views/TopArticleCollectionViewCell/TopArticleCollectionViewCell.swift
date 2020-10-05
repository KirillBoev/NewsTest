//
//  TopArticleCollectionViewCell.swift
//  NewsTest
//
//  Created by Kirill Boev on 04.10.2020.
//

import UIKit

class TopArticleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func update(article: ArticleViewModel) {
        
        titleLable.text = article.title
        descriptionLable.text = article.description
        articleImageView.sd_setImage(with: URL(string: article.urlToImage ?? ""), completed: nil)
        
    }
}
