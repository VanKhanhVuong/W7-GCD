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
        self.avatar = json["avatar"] as? String ?? ""
        self.info = InfoItem(json: json["info"] as? [String:Any] ?? [:])
        self.studentId = json["student_id"] as? String ?? ""
    }
}

extension InfoItem {
    init?(json: [String:Any]) {
        self.name = json["name"] as? String ?? ""
        self.birthday = json["birthday"] as? String ?? ""
    }
}

