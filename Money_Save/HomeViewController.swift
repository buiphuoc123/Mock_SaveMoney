//
//  HomeViewController.swift
//  Money_Save
//
//  Created by Bui Phuoc on 6/6/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import UIKit
import FirebaseAuth
class HomeViewController: UIViewController, SetValuePreviousVC {
   
    @IBOutlet weak var lblMyMoney: UILabel!
    
    @IBOutlet weak var lblDienGiai: UITextField!
    
    @IBOutlet weak var lblNgay: UILabel!
    
    @IBOutlet weak var soTientxt: UITextField!
    
    @IBOutlet weak var segmentHangMuc: UISegmentedControl!
    
    @IBOutlet weak var lblTenMuc: UILabel!
    
    
    @IBOutlet weak var nameImage: UIImageView!
    @IBOutlet weak var tenHangMuctxt: UITextField!
    
    //var myMoney = String()
    var nameHangMuc = String()
    var dienGiai = String()
    var day = String()
    var flag :Int = 1
    
    var moneyinput = Int()
    var moneynew = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTenMuc.text = "Mục chi"
        lblMyMoney.text = "\(User.sotien ?? 0)"
        //lblNgay.text = "Hôm nay"
        let day = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/mm/yyyy"
        lblNgay.text = dateFormatter.string(from: day) + " (Hôm nay)"
        
      
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickSegment(_ sender: Any) {
        switch segmentHangMuc.selectedSegmentIndex {
        case 0:
            lblTenMuc.text = "Mục chi"
           // lblTenMuc.textColor = UIColor.blue
            flag = 1
        case 1:
            lblTenMuc.text = "Mục thu"
            //lblTenMuc.textColor = UIColor.red
            flag = 2
        default:
            break
        }
    }
    
    @IBAction func clickHangMuc(_ sender: Any) {
        if flag == 1 {
            self.soTientxt.text = ""
            self.tenHangMuctxt.text = ""
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HangMucChiViewController") as! HangMucChiViewController
            
            vc.myDelegate = self
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if flag == 2 {
            self.soTientxt.text = ""
            self.tenHangMuctxt.text = ""
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "hangmucthu") as! HangMucThuViewController
            vc.myDelegate = self
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func clickDienGiai(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DienGiaiViewController") as! DienGiaiViewController
        vc.myDelegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func clickNgay(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DayViewController") as! DayViewController
        vc.myDelegate = self
        self.navigationController?.pushViewController(vc, animated: true)


    }
    
    @IBAction func clickLuu(_ sender: Any) {
        let thuchi = ThuChi(titled: lblTenMuc.text!, namemuc: tenHangMuctxt.text!, ngay: lblNgay.text!, sotien: soTientxt.text!)
        moneyinput = Int(soTientxt.text!)!
        moneynew = Int(lblMyMoney.text!)!
        if flag == 1{
            if(moneynew > moneyinput){
                
                moneynew = moneynew - moneyinput
                lblMyMoney.text = String(moneynew)
                
                GetData.AddData(transactionModel: thuchi, completionHandler: { (error) in
                    if error == nil {
                        self.soTientxt.text = ""
                        self.tenHangMuctxt.text = ""
                        
                        self.showSuccessAlert(titleAlert: "Thông báo", messageAlert: "Da ghi thanh cong")
                    } else {
                        self.showSuccessAlert(titleAlert: "Thông báo", messageAlert: "Ghi that bai")
                    }
                })
                
            }
            else{
                self.showSuccessAlert(titleAlert: "Thông báo", messageAlert: "Số tiền trong ví nhỏ hơn số tiền bạn nhập vào. Vui lòng kiểm tra lại")
            }
            
        }
        else {
            moneynew = moneynew - moneyinput
            lblMyMoney.text = String(moneynew)
            self.soTientxt.text = ""
            self.tenHangMuctxt.text = ""
        }
        
    }
    
    @IBAction func btnShowlist(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ListThuChiViewController") as! ListThuChiViewController
        //self.present(vc!, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
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
    
    
    func returnData(id: Int?, name: String?, image: UIImage?) {
        if id == 0 {
            if let ob = name {
                tenHangMuctxt.text = ob
            }
            if let img = image{
                nameImage.image = img
            }
        }
        if id == 1 {
            if let ob1 = name
            {
                lblDienGiai.text = ob1
            }
            if let img = image{
                nameImage.image = img
            }
        }
        if id == 2 {
            if let ob1 = name
            {
                lblNgay.text = ob1
            }
            if let img = image{
                nameImage.image = img
            }
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
