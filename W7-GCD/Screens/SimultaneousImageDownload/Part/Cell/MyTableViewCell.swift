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
    }
    
    static func identifier() -> String {
        return String(describing: self)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier(), bundle: nil)
    }
    
    func configure(urlString: String, index: Int) {
        myImageView.getImage(urlString: urlString, index: index)
    }
}

