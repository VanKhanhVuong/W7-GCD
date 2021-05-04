//
//  StudentTableViewCell.swift
//  W7-GCD
//
//  Created by Văn Khánh Vương on 28/04/2021.
//

import UIKit
class StudentTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var studentIdLabel: UILabel!
    @IBOutlet weak var studentImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func identifier() -> String {
        return String(describing: self)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier(), bundle: nil)
    }
    
    func configure(item: StudentItem, index: Int) {
        self.nameLabel.text = item.info?.name
        self.birthdayLabel.text = item.info?.birthday
        self.studentIdLabel.text = item.studentId
        if item.avatar == "" || item.avatar == nil {
            self.studentImageView.image = #imageLiteral(resourceName: "empty")
        } else {
            studentImageView.getImage(urlString: item.avatar ?? "", index:index)
        }
    }
}


