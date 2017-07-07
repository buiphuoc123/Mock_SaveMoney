//
//  MucLine.swift
//  Money_Save
//
//  Created by Cntt04 on 6/7/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import Foundation
import UIKit

class MucLine
{
    init() {
    }
    
    class func hangmucLines() -> [MucLine]
    {
        var muc = [Muc]()
        
        muc.append(Muc(titled: "Lương",  imageName: "luong"))
        muc.append(Muc(titled: "Thưởng",  imageName: "thuong"))
        muc.append(Muc(titled: "Được cho/tặng",  imageName: "tang"))
        muc.append(Muc(titled: "Tiền lãi",  imageName: "tienlai"))
        muc.append(Muc(titled: "Khác",  imageName: "khac"))
        
        return muc
    }
  
    
}
