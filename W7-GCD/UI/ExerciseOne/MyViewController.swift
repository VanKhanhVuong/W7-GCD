//
//  MyViewController.swift
//  W7-GCD
//
//  Created by Văn Khánh Vương on 26/04/2021.
//

import UIKit

class MyViewController: UIViewController {
    @IBOutlet weak var imageScrollView: UIScrollView!
    var viewModel = MyViewModel()
    var end: CGFloat = 0.0
    var pointEnd: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getUrlImageForArray()
        viewModel.delegate = self
    }
    
    func showImage(image:UIImage) {
        // Khởi tạo imageView mới và cấu hình kiểu hiển thị cho hình
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        // Cho imageView đó có hình image
        imageView.image = image
        
        // Phân biệt hình truyền vào là hình n hay hình thứ n + 1
        if end == 0.0 {
            // Nếu là hình n
            imageView.frame = CGRect(x: 0, y: 0, width: imageScrollView.frame.width, height: 200.0 )
        } else {
            // Ngược lại là hình n + 1
            if end != (image.size.height + image.size.width){
                imageView.frame = CGRect(x: 0, y: imageScrollView.contentSize.height, width: imageScrollView.frame.width, height: 200.0 + 5)
            }
        }
        
        // Lấy kích thước của toàn bộ bức ảnh -> Dùng để so sánh lại cho hình thứ 2 và thứ 3 chẳng hạn
        end = image.size.height + image.size.width
        imageScrollView.addSubview(imageView)
        
        // Dùng để hình thứ n - 1 không đè lên hình n
        // Mỗi bức hình cách nhau 5dp
        imageScrollView.contentSize = CGSize(width: self.view.frame.width, height: imageScrollView.contentSize.height + 5 + imageView.frame.height)
    }
}
extension MyViewController: MyViewModelEvents {
    func passData(passImage: UIImage) {
        showImage(image: passImage)
    }
    
    func passError(messageError: String) {
        print(messageError)
    }
}

