//
//  TitleDetailTableViewCell.swift
//  NewsTest
//
//  Created by Kirill Boev on 03.10.2020.
//

import UIKit

class TitleDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var publishedAtLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func update(title: String, date: String ) {
        titleLable.text = title
        publishedAtLable.text = date
    }
    
}

