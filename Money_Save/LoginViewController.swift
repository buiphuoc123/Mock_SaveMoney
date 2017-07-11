//
//  LoginViewController.swift
//  Money_Save
//
//  Created by Bui Phuoc on 6/5/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        
        let user = usernameText.text;
        let pass = passwordText.text;
        
        //let usernamrStore = UserDefaults.standard.string(forKey: "user");
        //let passwordStore = UserDefaults.standard.string(forKey: "pass");
        
        /*if(usernamrStore == user){
            if(passwordStore == pass)
            {
                let defaults = UserDefaults.standard
                defaults.set(true, forKey: "isLogin")
                defaults.synchronize()
               performSegue(withIdentifier: "insertmoney", sender: self)
            }
        }*/
        
        Auth.auth().signIn(withEmail: user!, password: pass!) { (user, error) in
            if error != nil
            {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
            else
            {
                User.uid = user?.uid
                User.email = user?.email
                //User.sotien = user?.sotien
                 let ref = Database.database().reference()
                ref.child("User").child(User.uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                    if snapshot.exists() {
                        if let snapshot = snapshot.value as? [String: AnyObject] {
                            if let soTien = snapshot["sotien"] as? Int {
                                if soTien != -1 {
                                    User.sotien = soTien
                                    
                                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuanlyUserViewController") as! QuanlyUserViewController
                                    self.navigationController?.pushViewController(vc, animated: true)
                                } else {
                                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "InsertViewController") as! InsertViewController
                                    self.navigationController?.pushViewController(vc, animated: true)
                                }
                            }
                        }
                    } 
                })
                
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
