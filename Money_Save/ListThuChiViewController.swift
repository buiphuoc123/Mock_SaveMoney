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
    var thus: [ThuChi] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTable.dataSource = self
        
        getData()
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
    
    @IBAction func btnThem(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
       
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getData() {
        GetData.getData(completionHandler: { (thus, error) in
            if error == nil {
                self.thus = []
                self.thus = thus!
                
                DispatchQueue.main.async {
                    self.myTable.reloadData()
                }
            } else {
                print(error)
            }
        })
    }
}
