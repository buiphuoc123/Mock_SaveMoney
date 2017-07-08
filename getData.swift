//
//  getData.swift
//  Money_Save
//
//  Created by NhatDuy on 7/8/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import Foundation
import FirebaseDatabase

class GetData {
    static var ref : DatabaseReference?
    
    static func getData(completionHandler: @escaping (_ thus: [ThuChi]?, _ error: String?) -> Void) {
        ref = Database.database().reference()
        var thus: [ThuChi] = []
        
        ref?.child("User").child(User.uid!).child("giao_dich").observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.exists() {
                if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                    for snap in snapshot {
                        if let postDict = snap.value as? [String: AnyObject] {
                            let transaction = ThuChi(json: postDict)
                            thus.append(transaction)
                        }
                    }
                    completionHandler(thus, nil)
                }
            } else {
                let error = "Not data"
                completionHandler(nil, error)
            }
        })
    }
    static func AddData(transactionModel: ThuChi, completionHandler: @escaping (_ error: Error?) -> Void){
        ref = Database.database().reference()
        let user = User.uid
        let data = [
            "loai_giao_dich": transactionModel.title,
            "ten_giao_dich": transactionModel.namemuc,
            "ngay": transactionModel.ngay,
            "so_tien": Int(transactionModel.sotien)!,
            
            ] as [String : Any]
        
        ref?.child("User").child(user!).child("giao_dich").childByAutoId().setValue(data, withCompletionBlock: { (error, ref) in
            completionHandler(error)
        })
    }
    
}
