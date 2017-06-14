//
//  LoginViewController.swift
//  Money_Save
//
//  Created by Bui Phuoc on 6/5/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

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
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "InsertViewController")
                self.present(vc!, animated: true, completion: nil)
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
