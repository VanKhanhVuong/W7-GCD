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
    
    func configure(item: StudentItem) {
        self.nameLabel.text = item.info?.name
        self.birthdayLabel.text = item.info?.birthday
        self.studentIdLabel.text = item.studentId
    }
    
    func showAvatar(urlItem : String) {
        guard let url = URL(string: urlItem) else { return }
        DispatchQueue.global(qos: .default).async {
            if let data = try? Data(contentsOf: url){
                DispatchQueue.main.async {
                    self.studentImageView.image = UIImage(data: data)
                }
            }
        }
    }
}
