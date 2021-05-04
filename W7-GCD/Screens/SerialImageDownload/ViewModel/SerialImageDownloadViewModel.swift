//
//  MyViewModel.swift
//  W7-GCD
//
//  Created by Văn Khánh Vương on 26/04/2021.
//

import Foundation

protocol SerialImageDownloadViewModelEvents: class {
    func gotData(image: Data)
    func gotError(message: String)
}

class SerialImageDownloadViewModel {
    weak var delegate: SerialImageDownloadViewModelEvents?
    let arrayUrlImage: [String] = ["https://images.pexels.com/photos/924824/pexels-photo-924824.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.unsplash.com/photo-1600779056574-779e0bd3e3f0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80","https://images.unsplash.com/photo-1540325320410-f3ee366fdbc6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80","https://images.unsplash.com/photo-1610643678560-bb3f9bdfe364?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=976&q=80","https://images.unsplash.com/photo-1610643748471-2eae4a44bd18?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=975&q=80","https://images.unsplash.com/photo-1609971757431-439cf7b4141b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80","https://images.unsplash.com/photo-1618737037107-7b92e93cdba0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=975&q=80","https://images.unsplash.com/photo-1618767629170-7cf48e1ff68a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=959&q=80","https://images.unsplash.com/photo-1618769122176-fa6658e4bc61?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80","https://images.unsplash.com/photo-1588414795854-dc3b0905bcbc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80","https://images.unsplash.com/photo-1619369537880-8206b88573d6?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8NnNNVmpUTFNrZVF8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60","https://images.unsplash.com/photo-1619029073214-53881475044d?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDR8NnNNVmpUTFNrZVF8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60","https://images.unsplash.com/photo-1606744666360-2f22c8b4a45b?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDV8NnNNVmpUTFNrZVF8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60","https://images.unsplash.com/photo-1619271121705-61b5c3faaae9?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDd8NnNNVmpUTFNrZVF8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60","https://images.unsplash.com/photo-1601054578112-7fb1d6ab06d6?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDE0fDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60","https://images.unsplash.com/photo-1529753944348-a67f54c92321?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDE5fDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60","https://images.unsplash.com/photo-1599146898085-00d469dd8b72?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDIyfDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60","https://images.unsplash.com/photo-1618974693001-1f0f0f7a0212?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDI5fDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60","https://images.unsplash.com/photo-1605103356992-93bd5fee32e5?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDMzfDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60","https://images.unsplash.com/photo-1611844252715-0e2ad518452c?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDM4fDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60","https://images.unsplash.com/photo-1556821289-373d7ecd71b4?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDQ0fDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60","https://images.unsplash.com/photo-1552083375-1447ce886485?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2100&q=80",
                                   "https://images.unsplash.com/photo-1610818544205-9830e171384c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
                                   "https://images.unsplash.com/photo-1612855619754-64a7c41db296?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
                                   "https://images.unsplash.com/photo-1617120509865-a3cc8fdc0a0f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2978&q=80",
                                   "https://images.unsplash.com/photo-1571366343168-631c5bcca7a4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2251&q=80",
                                   "https://images.unsplash.com/photo-1568897451406-94d62ae18aea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1300&q=80",
                                   "https://images.unsplash.com/photo-1614771243521-7554dccb34c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80",
                                   "https://images.unsplash.com/photo-1577996447834-c360b24977fb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1276&q=80",
                                   "https://images.unsplash.com/photo-1615800792790-e3ce75c49f7c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
                                   "https://images.unsplash.com/photo-1560262829-d47e51d95ee8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2978&q=80",
                                   "https://images.unsplash.com/photo-1526035266069-fc237c5baddd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1867&q=80",
                                   "https://images.unsplash.com/photo-1559180377-78572fb6e06f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2100&q=80",
                                   "https://images.unsplash.com/photo-1610123598147-f632aa18b275?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2978&q=80",
                                   "https://images.unsplash.com/photo-1615235225749-2d727548bd10?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=3061&q=80",
                                   "https://images.unsplash.com/photo-1612698093158-e07ac200d44e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2100&q=80",
                                   "https://images.unsplash.com/photo-1605007493699-af65834f8a00?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2102&q=80",
                                   "https://images.unsplash.com/photo-1614102073832-030967418971?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80",
                                   "https://images.unsplash.com/photo-1619419497368-12c94fae126b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80",
                                   "https://images.unsplash.com/photo-1619418919159-c28ea91ad1f6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80",
                                   "https://images.unsplash.com/photo-1619371039016-b4b8356287ef?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1231&q=80",
                                   "https://images.unsplash.com/photo-1569389397653-c04fe624e663?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80"]
    
    func getUrlImageForArray() {
        DispatchQueue.global(qos: .background).async {
            for imageString in self.arrayUrlImage {
                guard let thumbnailUrl = URL(string: imageString) else {
                    continue
                }
                let group = DispatchGroup()
                print(thumbnailUrl)
                print("-------- GROUP ENTER ----------")
                group.enter()
                URLSession.shared.dataTask(with: thumbnailUrl) { data, response, error in
                    print(response?.suggestedFilename ?? thumbnailUrl.lastPathComponent)
                    if let imgData = data {
                        DispatchQueue.main.async {
                            if !imgData.isEmpty {
                                self.delegate?.gotData(image: imgData)
                            } else {
                                if let error = error {
                                    self.delegate?.gotError(message: "\(error)")
                                }
                            }
                        }
                    } else {
                        if let error = error {
                            self.delegate?.gotError(message: "\(error)")
                        }
                    }
                    group.leave()
                }.resume()
                group.wait()
            }
        }
    }
}
