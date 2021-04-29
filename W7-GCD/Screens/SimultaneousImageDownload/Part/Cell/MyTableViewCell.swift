//
//  MyTableViewCell.swift
//  W7-GCD
//
//  Created by Văn Khánh Vương on 26/04/2021.
//

import UIKit
let imageCache = NSCache<AnyObject, AnyObject>()
class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var myImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(urlString: String, index: Int) {
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            myImageView.image = imageFromCache
            return
        }
        self.myImageView.image = #imageLiteral(resourceName: "empty")
        DispatchQueue.global(qos: .default).async {
            guard let url = URL(string: urlString) else { return }
            if let data = try? Data(contentsOf: url){
                DispatchQueue.main.async {
                    guard let imageToCache = UIImage(data: data) else { return }
                    if self.tag == index{
                        self.myImageView.image = imageToCache
                    }
                    imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                }
            }
        }
    }
}

