//
//  HangMucChiTableViewController.swift
//  Money_Save
//
//  Created by Cntt04 on 6/7/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import UIKit

class HangMucChiTableViewController: UITableViewController {

    // Data Source
    lazy var eventLines: [MucLine] = {
        return MucLine.eventLines()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Management Events"                            // Đặt tiêu đề cho View
        self.navigationItem.leftBarButtonItem = self.editButtonItem     // Đặt Button Edit
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Số section của Table View (Tổng số ngày trong tuần)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return eventLines.count
    }
    
    // Số hàng mỗi section (Tổng số sự kiện mỗi ngày)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let eventLine = eventLines[section]
        return eventLine.events.count
    }
    
    // Đổ dữ liệu vào Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "muc_cell", for: indexPath)
        
        let eventLine = eventLines[indexPath.section]   // Xác định section hiện tại (ngày hiện tại)
        let event = eventLine.events[indexPath.row]     // Xác định row hiện tại (sự kiện hiện tại)
        
        // Đưa tên và chi tiết sự kiện để hiển thị ra các Cell
        cell.textLabel?.text = event.title
        cell.detailTextLabel?.text = event.description
        
        return cell
    }
    
    // Đặt tiêu đề cho mỗi Section là tên Ngày
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let eventLine = eventLines[section]
        return eventLine.day
    }
    
    // Xử lý khi người dùng xoá một sự kiện
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let eventLine = eventLines[indexPath.section]
            eventLine.events.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    // Xử lý khi người dùng di chuyển một sự kiện
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
        let eventLine1 = eventLines[fromIndexPath.section]
        let eventLine2 = eventLines[toIndexPath.section]
        let event = eventLine1.events[fromIndexPath.row]
        eventLine1.events.remove(at: fromIndexPath.row)
        eventLine2.events.insert(event, at: toIndexPath.row)
    }
    
    // MARK: - Navigation
    // Hàm chuẩn bị trước khi điều hướng sang View Chi tiết sự kiện: xác định là sự kiện nào và thuộc ngày nào
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // if let identifier = segue.identifier {
    //   switch identifier {
    //   case "EventDetail":
    //      let eventDetailVC = segue.destination as! MucDetailTableViewController
    //      if let indexPath = self.tableView.indexPathForSelectedRow {
    //         eventDetailVC.event = eventAtIndexPath(indexPath: indexPath as NSIndexPath)
    //         eventDetailVC.dayDetail = dayAtIndexPath(indexPath: indexPath as NSIndexPath)
    //      }
    //      break
    
    //  default:
    //      break
    //  }
    //  }
    //  }
    
    // MARK: - Helper Method
    
    func eventAtIndexPath(indexPath: NSIndexPath) -> Muc
    {
        let eventLine = eventLines[indexPath.section]
        return eventLine.events[indexPath.row]
    }
    
    func dayAtIndexPath(indexPath: NSIndexPath) -> String
    {
        let eventLine = eventLines[indexPath.section]
        return eventLine.day
    }
    
}
