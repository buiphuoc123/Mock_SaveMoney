//
//  Muc.swift
//  Money_Save
//
//  Created by Cntt04 on 6/7/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import Foundation
import UIKit

class Muc
{
    var title: String           //biến lưu tên sự kiện (event)
    var description: String     //biến lưu chi tiết sự kiện
    
    //Một sự kiện chuẩn: gồm tên và chi tiết
    init(titled: String, description: String)
    {
        self.title = titled
        self.description = description
    }
}
