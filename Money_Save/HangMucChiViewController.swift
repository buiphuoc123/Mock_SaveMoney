//
//  HangMucChiViewController.swift
//  Money_Save
//
//  Created by Bui Phuoc on 7/7/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import UIKit

class HangMucChiViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var hangmucchicha: [ListHangMucChi] = {
        return ListHangMucChi.listHangMuc()
    }()
    
    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        myTable.delegate = self
        
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
        let hangmuccon = hangmucchicha[section].hangmucchi
        return hangmuccon.count
    }
    
    //Số section hiển thị
    func numberOfSections(in tableView: UITableView) -> Int {
        return hangmucchicha.count
    }
    //Chỉnh nội dung cho từng cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DongHangMucChiTableViewCell
        
        //Configure Cell
        let event = hangmucchicha[indexPath.section].hangmucchi[indexPath.row]
        cell.configureCell(hangmucchi: event)
       
        
        return cell
    }
    //Set tiêu đề cho từng section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return hangmucchicha[section].name
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
