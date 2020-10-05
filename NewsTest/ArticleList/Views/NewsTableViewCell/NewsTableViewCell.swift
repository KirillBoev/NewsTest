//
//  NewsTableViewCell.swift
//  News
//
//  Created by Kirill Boev on 01.10.2020.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        descriptionLabel.font.withSize(14)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func update(article: ArticleViewModel) {
        
        titleLabel.text = article.title
        descriptionLabel.text = article.description
        articleImageView.sd_setImage(with: URL(string: article.urlToImage ?? ""), completed: nil)
    }
}

