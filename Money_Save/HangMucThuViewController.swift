//
//  HangMucThuViewController.swift
//  Money_Save
//
//  Created by Bui Phuoc on 7/6/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import UIKit

protocol SetValuePreviousVC {
    func returnData(id: Int?, name: String?)
}
class HangMucThuViewController: UIViewController, UITableViewDataSource , UITableViewDelegate {

    
    
    @IBOutlet weak var myTable: UITableView!
    
    var mucs: [Muc] = []
    var myDelegate: SetValuePreviousVC?
    var revenueTypeList: [RevenueType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTable.dataSource = self
        myTable.delegate = self
        
        getDataThu()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // hàm trả về sô lượng dòng trong tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return mucs.count
    }
    // Hàm hiển thị nội dung trong dòng
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DongHangMucThuTableViewCell
        let muc: Muc
        muc = mucs[indexPath.row]
        cell.configureHangMucViewCell(muc: muc)
        return cell
        
    }
    //Hàm bắt sự kiện khi click chọn hạng mục thu    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revenueType = mucs[indexPath.row] as Muc
        
        
        myDelegate?.returnData(id: 0, name: revenueType.title)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.popViewController(animated: true)
    }
    func getDataThu() {
        GetDataThu.getData(completionHandler: { (mucs, error) in
            if error == nil {
                self.mucs = mucs!
                
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
