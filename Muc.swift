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
    var title: String
    var image: UIImage
    
    
    init(titled: String, imageName: String)
    {
        self.title = titled
        if let img = UIImage(named: imageName) {
            image = img
        } else {
            image = UIImage(named: "default")!
        }
    }
    init(json: [String: AnyObject]) {
        
       
        self.title = (json["ten"] as? String)!
        self.image = UIImage(named: (json["hinh"] as? String)!)!
    }
}
