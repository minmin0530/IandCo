//
//  SelfTableViewCell.swift
//  IandCo003
//
//  Created by 泉芳樹 on 2022/02/06.
//

import UIKit

class SelfTableViewCell: UITableViewCell {
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    func configure(value: String, date: String) {
        valueLabel.text = value
        dateLabel.text = date
    }
}
