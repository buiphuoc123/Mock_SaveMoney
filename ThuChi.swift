//
//  ThuChi.swift
//  Money_Save
//
//  Created by Bui Phuoc on 7/6/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import Foundation
import UIKit

class ThuChi
{
    var title: String
    var namemuc: String
    var ngay: String
    var sotien: String
    
    
    init(titled: String, namemuc: String, ngay: String, sotien: String)
    {
        self.title = titled
        self.namemuc = namemuc
        self.ngay = ngay
        self.sotien = sotien
        
    }
    
    init(json: [String: AnyObject]) {
        if let soTien = json["so_tien"] as? Int {
            self.sotien = String("\(soTien)")
        } else {
            self.sotien = "0"
        }
        self.namemuc = (json["ten_giao_dich"] as? String)!
        self.title = (json["loai_giao_dich"] as? String)!
        self.ngay = (json["ngay"] as? String)!
    }
}
