//
//  DongHangMucChiTableViewCell.swift
//  Money_Save
//
//  Created by Bui Phuoc on 7/7/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import UIKit

class DongHangMucChiTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgHinh: UIImageView!

    @IBOutlet weak var lblname: UILabel!
    
    func configureCell(hangmucchi: HangMucChi) {
        self.imgHinh.image =  hangmucchi.image
        self.lblname.text = hangmucchi.title
    }
    

}
