//
//  MyViewController.swift
//  W7-GCD
//
//  Created by Văn Khánh Vương on 26/04/2021.
//

import UIKit

class SerialImageDownloadVC: UIViewController {
    @IBOutlet weak var imageScrollView: UIScrollView!
    var viewModel = SerialImageDownloadViewModel()
    var imageCurrentSize: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getUrlImageForArray()
    }
    
    func showImage(image:UIImage) {
        // Init imageView
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        
        //If imageCurrentSize is 0.0 then that image is the first downloaded image reverse imageCurrentSize already has a value then that image is the downloaded image after the first image.
        if imageCurrentSize == 0.0 {
            imageView.frame = CGRect(x: 0, y: 0, width: imageScrollView.frame.width, height: 200.0)
        } else {
            
            // We check if the imageCurrentSize variable is different from the image size it proves that a new image wants to show
            if imageCurrentSize != (image.size.height + image.size.width) {
                imageView.frame = CGRect(x: 0, y: imageScrollView.contentSize.height, width: imageScrollView.frame.width, height: 200.0 + 5)
            }
        }
        
        // We assign the value to the variable imageCurrentSize equal to the size of the currently displayed image.
        imageCurrentSize = image.size.height + image.size.width
        imageScrollView.addSubview(imageView)
        imageScrollView.contentSize = CGSize(width: self.view.frame.width, height: imageScrollView.contentSize.height + 5 + imageView.frame.height)
    }
}
extension SerialImageDownloadVC: SerialImageDownloadViewModelEvents {
    func gotData(image: UIImage) {
        showImage(image: image)
    }
    
    func gotError(message: String) {
        print(message)
    }
}

