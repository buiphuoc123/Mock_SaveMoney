//
//  User.swift
//  Money_Save
//
//  Created by NhatDuy on 7/8/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import Foundation
class User {
    
    static var uid: String?
    static var sotien: Int?
    static var email: String?
    
    static func setInfo(json: [String: AnyObject]) {
       // self.name = json["ten"] as? String
        //self.age = json["tuoi"] as? Int
        self.sotien = json["sotien"] as? Int
    }
    
    static func setInfo( sotien: Int) {
       // self.name = name
       // self.age = age
        self.sotien = sotien
    }
}
