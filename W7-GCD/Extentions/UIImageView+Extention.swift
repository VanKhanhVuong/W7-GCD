//
//  UIImageView+cacheImage.swift
//  W7-GCD
//
//  Created by Văn Khánh Vương on 01/05/2021.
//

import UIKit

extension UIImageView {
    static var imageCache = NSCache<AnyObject, AnyObject>()
    func getImage(urlString: String, index: Int) {
        if let imageFromCache = UIImageView.imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        guard let url = URL(string: urlString) else { return }
        let tagImage: Int = index
        self.image = UIImage(named: "empty")
        DispatchQueue.global(qos: .background).async {
            if let data = try? Data(contentsOf: url){
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                    guard let imageToCache = UIImage(data: data) else { return }
                    if tagImage == index{
                        self.image = imageToCache
                    }
                    UIImageView.imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                }
            }
        }
    }
}
