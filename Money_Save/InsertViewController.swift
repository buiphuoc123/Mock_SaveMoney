//
//  InsertViewController.swift
//  Money_Save
//
//  Created by Bui Phuoc on 6/6/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import UIKit

class InsertViewController: UIViewController {

    @IBOutlet weak var lblSoTien: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnInsertMoney(_ sender: Any) {
        
        let sotien = lblSoTien.text
        if(sotien?.isEmpty)!{
            self.showSuccessAlert(titleAlert: "Thông báo", messageAlert: "Bạn chưa điền số tiền. Vui lòng kiểm tra lại!!!")
            
            return
        }
        else{
            
            performSegue(withIdentifier: "home", sender: self)
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let homeController = segue.destination as! HomeViewController
        homeController.myMoney = lblSoTien.text!
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
