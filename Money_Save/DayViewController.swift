//
//  DayViewController.swift
//  Money_Save
//
//  Created by Bui Phuoc on 7/6/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import UIKit

class DayViewController: UIViewController {

    
    @IBOutlet weak var dayPicker: UITextField!
    let datePicker: UIDatePicker
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createDatePicker()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createDatePicker(){
        // Cấu hình date
        datePicker.datePickerMode = .date
        dayPicker.text = "\(datePicker.date)"
        
        let toolbar = UIToolbar
        toolbar.sizeToFit()
        //
        let doneButton = UIBarButtonItem(UIBarButtonSystemItem: .done, target: nil, action: #selector(doneClick()))
        toolbar.setItems([doneButton], animated: false)
        
        dayPicker.inputAccessoryView = toolbar
        
        dayPicker.inputView = datePicker
    
    }
    
    func doneClick(){
        // cấu hình date
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .short
        dateFormat.timeStyle = .none
    //
        dayPicker.text = dateFormat.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @IBAction func clickXong(_ sender: Any) {
        if dayPicker.text == nil
        {
            self.showSuccessAlert(titleAlert: "Thông báo", messageAlert: "Bạn chưa điền đầy đủ thông tin")
        }
        else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
            self.present(vc!, animated: true, completion: nil)
        }
    }
    
    //Hàm lấy nội dung từ dayView, đưa vào mục thu.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let homeController = segue.destination as! HomeViewController
        
        homeController.day = dayPicker.text
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
