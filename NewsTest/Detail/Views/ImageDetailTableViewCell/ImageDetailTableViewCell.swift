//
//  ImageDetailTableViewCell.swift
//  NewsTest
//
//  Created by Kirill Boev on 03.10.2020.
//

import UIKit

class ImageDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    let height = 350
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func update(urlToImage: String ){
        detailImageView.sd_setImage(with: URL(string: urlToImage ?? "" ), completed: nil)
        
    }
}
