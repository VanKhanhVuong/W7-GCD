//
//  Student.swift
//  W7-GCD
//
//  Created by Văn Khánh Vương on 28/04/2021.
//

import Foundation

struct ResponseObject: Decodable {
    var status : Int
    var errors : [ErrorItem]?
    var data: [StudentItem]?
}

struct StudentItem: Decodable {
    let info: InfoItem?
    let avatar: String?
    let studentId: String?
    enum CodingKeys: String, CodingKey {
        case info
        case avatar
        case studentId = "student_id"
       }
    

}
struct InfoItem: Decodable {
    var name: String?
    var birthday: String?
}

struct ErrorItem: Decodable {
    var code: String?
    var message: String?
}

extension StudentItem {
    init?(json: [String:Any]) {
        guard let avatar = json["avatar"] as? String,
              let info = json["info"] as? InfoItem,
              let studentId = json["student_id"] as? String
        else {
            return nil
        }
        self.avatar = avatar
        self.info = info
        self.studentId = studentId
    }
}

extension InfoItem {
    init?(json: [String:Any]) {
        guard let name = json["name"] as? String,
              let birthday = json["birthday"] as? String
        else {
            return nil
        }
        self.name = name
        self.birthday = birthday
    }
}

