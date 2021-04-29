//
//  ReadJSONModel.swift
//  W7-GCD
//
//  Created by Văn Khánh Vương on 28/04/2021.
//

import Foundation
protocol ReadJSONViewModelEvents: class {
    func gotData()
    func gotError(message: String)
}

class ReadJSONViewModel {
    weak var delegate: ReadJSONViewModelEvents?
    var apiService = APIService()
    var arrayStudent: [StudentItem] = []

    func getDataFromApi() {
        apiService.getDataJsonLocal()
        apiService.fetchInfoStudent { [weak self] result in
            guard let self = self else { return }
            if !result.isEmpty {
                result.forEach { (student) in
                    self.arrayStudent.append(student)
                }
                self.delegate?.gotData()
            } else {
                self.delegate?.gotError(message: "Sorry we cannot get the data please try again later !")
            }
        }
    }
}
