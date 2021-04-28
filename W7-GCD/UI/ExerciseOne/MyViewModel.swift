//
//  MyViewModel.swift
//  W7-GCD
//
//  Created by Văn Khánh Vương on 26/04/2021.
//

import UIKit
protocol MyViewModelEvents: class {
    func passData(passImage:UIImage)
    func passError(messageError: String)
}

class MyViewModel {
    weak var delegate: MyViewModelEvents?
    let arrayUrlImage: [String] = ["https://images.pexels.com/photos/924824/pexels-photo-924824.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.unsplash.com/photo-1600779056574-779e0bd3e3f0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80","https://images.unsplash.com/photo-1540325320410-f3ee366fdbc6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80","https://images.unsplash.com/photo-1610643678560-bb3f9bdfe364?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=976&q=80","https://images.unsplash.com/photo-1610643748471-2eae4a44bd18?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=975&q=80","https://images.unsplash.com/photo-1609971757431-439cf7b4141b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80","https://images.unsplash.com/photo-1618737037107-7b92e93cdba0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=975&q=80","https://images.unsplash.com/photo-1618767629170-7cf48e1ff68a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=959&q=80","https://images.unsplash.com/photo-1618769122176-fa6658e4bc61?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80","https://images.unsplash.com/photo-1588414795854-dc3b0905bcbc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80"]
    
    func getUrlImageForArray() {
        for i in 0..<self.arrayUrlImage.count {
            let queue = DispatchQueue(label: "LoadImage")
            queue.async {
                self.getImage(urlImage: self.arrayUrlImage[i])
            }
        }
    }
    
    func getImage(urlImage:String){
        if let thumbnailUrl = URL(string: urlImage){
            do {
                let data = try! Data(contentsOf: thumbnailUrl)
                DispatchQueue.main.async {
                    guard let image: UIImage = UIImage(data: data) else { return }
                    self.delegate?.passData(passImage: image)
                }
            }
        }
    }
}
