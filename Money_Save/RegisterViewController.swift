	//
//  RegisterViewController.swift
//  Money_Save
//
//  Created by Bui Phuoc on 6/5/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

//import Cocoa
import UIKit
import FirebaseAuth
import FirebaseDatabase
    
class RegisterViewController: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var confirmPassText: UITextField!
    
    @IBOutlet weak var messageText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnRegister(_ sender: Any) {
        let user = usernameText.text
        let pass = passwordText.text
        let cofirmpass = confirmPassText.text
        
        

        
        // Kiem tra 
        if((user?.isEmpty)! || (pass?.isEmpty)! || (cofirmpass?.isEmpty)!){
            
            self.showSuccessAlert(titleAlert: "Thông báo", messageAlert: "Bạn chưa điền đầy đủ thông tin. Vui lòng kiểm tra lại!!!")
            
            
        }
        else
        {
            if(pass != cofirmpass){
                self.showSuccessAlert(titleAlert: "Thông báo", messageAlert: "Mật khẩu không khớp. Vui lòng kiểm tra lại!!")
                
            }
            else{
            Auth.auth().createUser(withEmail: user!, password: pass!, completion: { (user1, error) in
                if error != nil
                {
                    self.showSuccessAlert(titleAlert: "Thông báo", messageAlert: "Ten dang nhap co dang la email!! Vui long kiem tra lai")
                                   }
                else
                {
                    let ref = Database.database().reference()
                    ref.child("User").child(user1!.uid).setValue(["sotien": -1], withCompletionBlock: { (error, ref) in
                        if error == nil {
                            self.showSuccessAlert(titleAlert: "Thông báo", messageAlert: "Chúc mừng bạn đã đăng kí thành công!!!")
                        } else {
                            print(error?.localizedDescription)
                        }
                    })
                    // Thong bao dang ki thanh cong
                    
                }
            })
            }

        }
        
        // Data
        /*let defaults = UserDefaults.standard
        defaults.set("user", forKey: user!)
        defaults.set("pass", forKey: pass!)
        defaults.synchronize()*/
        	
        
        
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
    
}
