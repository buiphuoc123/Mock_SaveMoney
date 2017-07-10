//
//  DongThuChiTableViewCell.swift
//  Money_Save
//
//  Created by Bui Phuoc on 7/6/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import UIKit

class DongThuChiTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titlename: UILabel!
    
    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var day: UILabel!
    
    @IBOutlet weak var money: UILabel!
    
    func configureHangMucViewCell(muc: ThuChi) {
        if muc.title == "Mục thu"{
            self.titlename.textColor = UIColor.blue
        }
        else
        {
            self.titlename.textColor = UIColor.red

        }
        self.titlename.text = muc.title
        self.name.text = muc.namemuc
        self.day.text = muc.ngay
        self.money.text = muc.sotien
    }
}
