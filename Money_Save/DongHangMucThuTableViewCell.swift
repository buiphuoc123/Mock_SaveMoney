//
//  DongHangMucThuTableViewCell.swift
//  Money_Save
//
//  Created by Bui Phuoc on 7/6/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import UIKit

class DongHangMucThuTableViewCell: UITableViewCell {

    @IBOutlet weak var imgHinh: UIImageView!
   
    @IBOutlet weak var titletxt: UILabel!
    
    func configureHangMucViewCell(muc: Muc) {
        
        self.imgHinh.image =  muc.image
        self.titletxt.text = muc.title
    }
    
   
}
