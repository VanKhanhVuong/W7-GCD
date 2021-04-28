//
//  APIService.swift
//  W7-GCD
//
//  Created by Văn Khánh Vương on 26/04/2021.
//

import Foundation

struct APIService {
    var number: Int = 0
    func fetchImage(completion: @escaping ([Image]) -> ()) {
            let urlSring = "http://www.json-generator.com/api/json/get/bVRstYwWrm?indent=2"
            guard let url = URL(string: urlSring) else { return }
        
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                do {
                    guard let data = data else { return }
                    let dataArray = try decoder.decode([Image].self, from: data)
                    completion(dataArray)
                } catch {
                    print(error)
                }
            }.resume()
    }
}
