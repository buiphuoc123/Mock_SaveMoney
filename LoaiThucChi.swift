//
//  LoaiThucChi.swift
//  Money_Save
//
//  Created by NhatDuy on 7/8/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import Foundation
class RevenueType {
    var key: String?
    var name: String?
    var image: String?
    
    init(name: String?, image: String) {
        self.name = name
        self.image = image
    }
    
    init(json: [String: AnyObject]) {
        self.name = json["ten"] as? String
        self.image = json["hinh"] as? String
    }
}
