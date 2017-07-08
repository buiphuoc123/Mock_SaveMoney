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
   // let datePicker: UIDatePicker
    var myDelegate: SetValuePreviousVC?
    var revenueTypeList: [RevenueType] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBAction func clickDatePicker(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(DayViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    // cau hinh date
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dayPicker.text = dateFormatter.string(from: sender.date)
    }
    
    @IBAction func clickXong(_ sender: Any) {
        if dayPicker.text == nil
        {
            self.showSuccessAlert(titleAlert: "Thông báo", messageAlert: "Bạn chưa điền đầy đủ thông tin")
        }
        else {
            myDelegate?.returnData(id: 2, name: dayPicker.text)

            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    //Hàm lấy nội dung từ dayView, đưa vào mục thu.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let homeController = segue.destination as! HomeViewController
        
        homeController.day = dayPicker.text!
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
