//
//  HomeViewController.swift
//  Money_Save
//
//  Created by Bui Phuoc on 6/6/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
   
    @IBOutlet weak var lblMyMoney: UILabel!
    
    @IBOutlet weak var lblDienGiai: UITextField!
    
    @IBOutlet weak var lblNgay: UILabel!
    
    @IBOutlet weak var soTientxt: UITextField!
    
    @IBOutlet weak var segmentHangMuc: UISegmentedControl!
    
    @IBOutlet weak var lblTenMuc: UILabel!
    
    
    @IBOutlet weak var tenHangMuctxt: UITextField!
    
    var myMoney = String()
    var nameHangMuc = String()
    var dienGiai = String()
    var day = String()
    var flag :Int = 1
    
    var moneyinput = Int()
    var moneynew = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMyMoney.text = myMoney
        lblNgay.text = "Hôm nay"
        
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickSegment(_ sender: Any) {
        switch segmentHangMuc.selectedSegmentIndex {
        case 0:
            lblTenMuc.text = "Mục chi"
            flag = 1
        case 1:
            lblTenMuc.text = "Mục thu"
            flag = 2
        default:
            break
        }
    }
    
    @IBAction func clickHangMuc(_ sender: Any) {
        if flag == 1 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HangMucChiViewController")
            self.present(vc!, animated: true, completion: nil)
        }
        if flag == 2 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "hangmucthu")
            self.present(vc!, animated: true, completion: nil)
        }
    }

    @IBAction func clickDienGiai(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DienGiaiViewController")
        self.present(vc!, animated: true, completion: nil)
    }
    
    
    @IBAction func clickNgay(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DayViewController")
        self.present(vc!, animated: true, completion: nil)

    }
    
    @IBAction func clickLuu(_ sender: Any) {
        lblDienGiai.text = dienGiai
        lblNgay.text = day
        tenHangMuctxt.text = nameHangMuc
        moneyinput = Int(soTientxt.text)
        moneynew = Int(lblMyMoney.text)
        if(moneynew > moneyinput){
            
            moneynew = moneynew - moneyinput
            lblMyMoney.text = String(moneynew)
            
            
            
        }
        else{
            self.showSuccessAlert(titleAlert: "Thông báo", messageAlert: "Số tiền trong ví nhỏ hơn số tiền bạn nhập vào. Vui lòng kiểm tra lại")
        }
        
    }
    
    
    @IBAction func clickShowList(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ListThuChiViewController")
        self.present(vc!, animated: true, completion: nil)

        
    }
    
    func showSuccessAlert(titleAlert:NSString,messageAlert:NSString)
    {
        let alert:UIAlertController=UIAlertController(title:titleAlert as String, message: messageAlert as String, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
        }
        alert.addAction(okAction)
        if UIDevice.current.userInterfaceIdiom == .phone
        {
            self.present(alert, animated: true, completion: nil)
        }
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
