//
//  MyTableViewCell.swift
//  W7-GCD
//
//  Created by Văn Khánh Vương on 26/04/2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myImageView.contentMode = .scaleAspectFit
    }
}

