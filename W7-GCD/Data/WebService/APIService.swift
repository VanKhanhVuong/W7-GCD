//
//  APIService.swift
//  W7-GCD
//
//  Created by Văn Khánh Vương on 26/04/2021.
//

import Foundation


struct APIService {
    func getDataJsonInternet(completion: @escaping ([StudentItem]) -> ()) {
        let urlSring = "http://www.json-generator.com/api/json/get/bTYcSXopIO?indent=2"
        guard let url = URL(string: urlSring) else { return }
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(ResponseObject.self, from: data)
                    guard let resultData = result.data else { return }
                    if !resultData.isEmpty {
                        completion(resultData)
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

