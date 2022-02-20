//
//  HomeTableViewCell.swift
//  IandCo003
//
//  Created by 泉芳樹 on 2022/02/08.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

    func configure(name: String, value: String) {
        nameLabel.text = name
        valueLabel.text = value
    }
}
