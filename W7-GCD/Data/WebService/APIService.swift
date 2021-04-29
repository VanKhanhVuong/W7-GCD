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
    
    func fetchInfoStudent(completion: @escaping ([StudentItem]) -> ()) {
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
    
    func getDataJsonLocal() {
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
                }
            } catch {
                print(error)
            }
        }
    }
}

