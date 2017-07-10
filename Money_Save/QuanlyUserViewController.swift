//
//  QuanlyUserViewController.swift
//  Money_Save
//
//  Created by NhatDuy on 7/10/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import UIKit

class QuanlyUserViewController: UIViewController {

    
    @IBOutlet weak var tentaikhoan: UILabel!
    
    @IBOutlet weak var matkhau: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        tentaikhoan.text = User.email
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnDoiMatKhau(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DoiMatKhauViewController") as! DoiMatKhauViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func btnLichSuThuChi(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ListThuChiViewController") as! ListThuChiViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
