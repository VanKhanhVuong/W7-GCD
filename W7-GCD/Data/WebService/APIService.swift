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
    
    func getDataJsonLocal(completion: @escaping ([StudentItem]) -> ()) {
        if let path = Bundle.main.path(forResource: "test", ofType: "json") {
            do {
                var arrayStudent:[StudentItem] = []
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    for case let result in json["data"] as! [Any] {
                        if let student = StudentItem(json:result as! [String : Any]) {
                            arrayStudent.append(student)
                        }
                    }
                    completion(arrayStudent)
                }
            } catch {
                print(error)
            }
        }
    }
}

