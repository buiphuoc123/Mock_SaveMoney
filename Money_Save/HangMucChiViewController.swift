//
//  HangMucChiViewController.swift
//  Money_Save
//
//  Created by Bui Phuoc on 7/7/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import UIKit


class HangMucChiViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var chis: [HangMucChi] = []
    var myDelegate: SetValuePreviousVC?
    var revenueTypeList: [RevenueType] = []
    
    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        myTable.delegate = self
        getDataChi()
        
    }
    // Load lại dữ liệu sau khi chuyển view trở lại
    override func viewWillAppear(_ animated: Bool) {
       
        self.myTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     //Số hàng trong một section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  let hangmuccon = chis[section].hangmucchi
        return chis.count
    }
    
    //Số section hiển thị
    func numberOfSections(in tableView: UITableView) -> Int {
        return chis.count
    }
    //Chỉnh nội dung cho từng cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DongHangMucChiTableViewCell
        
        //Configure Cell
        let event = chis[indexPath.row]
        cell.configureCell(hangmucchi: event)
       
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revenueType = chis[indexPath.row] as HangMucChi
        
        
        myDelegate?.returnData(id: 0, name: revenueType.title)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.popViewController(animated: true)
    }
    //Set tiêu đề cho từng section
   // func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //    return chis[section].name
   // }
    func getDataChi() {
        GetDataChi.getData(completionHandler: { (chis, error) in
            if error == nil {
                self.chis = chis!
                DispatchQueue.main.async {
                    self.myTable.reloadData()
                }
            } else {
                print(error!)
            }
        })
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
