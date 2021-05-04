//
//  APIServiceLocal.swift
//  W7-GCD
//
//  Created by Văn Khánh Vương on 04/05/2021.
//

import Foundation

struct APIServiceLocal {
    func getDataJsonLocal(completion: @escaping ([StudentItem]) -> ()) {
        var arrayStudent:[StudentItem] = []
        guard let path = Bundle.main.path(forResource: "test", ofType: "json") else { return }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
        guard let jsons = json["data"] as? [Any] else { return }
        for resultData in jsons {
            guard let result = resultData as? [String : Any] else { return }
            if let student = StudentItem(json: result) {
                arrayStudent.append(student)
            }
        }
        completion(arrayStudent)
    }
}
