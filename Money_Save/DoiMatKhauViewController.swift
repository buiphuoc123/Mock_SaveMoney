//
//  DoiMatKhauViewController.swift
//  Money_Save
//
//  Created by NhatDuy on 7/10/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import UIKit
import FirebaseAuth

class DoiMatKhauViewController: UIViewController {

    @IBOutlet weak var mkhientai: UITextField!
    
    @IBOutlet weak var xacnhan: UITextField!
    @IBOutlet weak var mkmoi: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLuu(_ sender: Any) {
        if (mkhientai.text == "" || mkmoi.text == "" || xacnhan.text == "" ){
            self.showSuccessAlert(titleAlert: "Thông báo", messageAlert: "Vui lòng nhập đầy đủ thông tin")
        }
        else {
            if mkmoi.text != xacnhan.text {
                self.showSuccessAlert(titleAlert: "Thông báo", messageAlert: "Xác nhận mật khẩu mới không khớp")
            }
            else{
                let user = Auth.auth().currentUser
                
                // Kiểm tra mật khẩu nhập vào có trùng với mật khẩu hiện tại hay không?
                let credential = EmailAuthProvider.credential(withEmail: User.email!, password: mkhientai.text!)
                
                user?.reauthenticate(with: credential, completion: { (error) in
                    // Nếu có - > xuất lỗi
                    if error != nil{
                        //
                        self.showSuccessAlert(titleAlert: "Thông báo", messageAlert: "Nhập mật khẩu hiện tại không khớp! Vui lòng kiểm tra lại")
                    }
                        // Nếu không -> thành công
                    else{
                        Auth.auth().currentUser?.updatePassword(to: self.mkmoi.text!, completion: { (error) in
                            UserDefaults.standard.set(self.mkmoi.text, forKey: "password")
                            UserDefaults.standard.synchronize()
                            
                            self.showSuccessAlert(titleAlert: "Thông báo", messageAlert: "Đã đổi thành công")
                                
                               
                            
                        })
                    }
                })
            }
        }
        
    }
    //
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
