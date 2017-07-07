//
//  ListThuChiViewController.swift
//  Money_Save
//
//  Created by Bui Phuoc on 7/6/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import UIKit

class ListThuChiViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet weak var myTable: UITableView!
    var thus: [ThuChi]{
        var title: String
        var name: String
        var day: String
        var money1: String
        return ListThuChi.listThuChiLines()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DongThuChiTableViewCell
        let thu: ThuChi
        thu = thus[indexPath.row]
        cell.configureHangMucViewCell(muc: thu)
        return cell

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thus.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func clickBack(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
        self.present(vc!, animated: true, completion: nil)
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
