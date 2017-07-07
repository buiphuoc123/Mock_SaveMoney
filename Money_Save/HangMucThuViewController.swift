//
//  HangMucThuViewController.swift
//  Money_Save
//
//  Created by Bui Phuoc on 7/6/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import UIKit

class HangMucThuViewController: UIViewController, UITableViewDataSource , UITableViewDelegate{

    
    
    @IBOutlet weak var myTable: UITableView!
    
    var mucs: [Muc]{
        var title: String
        var image: UIImage
        return MucLine.hangmucLines()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        myTable.dataSource = self
        myTable.delegate = self
        
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
        let muc = Muc
        
        cell.configureHangMucViewCell(muc: muc)
        return cell
        
    }
    //Hàm bắt sự kiện khi click chọn hạng mục thu
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // chuyển về màn hình home
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
        
        self.present(vc!, animated: true, completion: nil)
    }
    
    //Hàm lấy nội dung từ hạng mục thu, đưa vào mục thu.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let homeController = segue.destination as! HomeViewController
       
      //homeController.nameHangMuc = mucs.indexPa
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
