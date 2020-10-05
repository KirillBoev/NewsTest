//
//  DescriptionDetailTableViewCell.swift
//  NewsTest
//
//  Created by Kirill Boev on 03.10.2020.
//

import UIKit

class DescriptionDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func update(description: String ){
        descriptionLable.text = description
}
}
