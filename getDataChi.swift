//
//  getDataChi.swift
//  Money_Save
//
//  Created by NhatDuy on 7/8/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import Foundation
import FirebaseDatabase

class GetDataChi {
    static var ref : DatabaseReference?
    
    static func getData(completionHandler: @escaping (_ thus: [HangMucChi]?, _ error: String?) -> Void) {
        ref = Database.database().reference()
        var thus: [HangMucChi] = []
        
        ref?.child("User").child(User.uid!).child("chi").observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.exists() {
                if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                    for snap in snapshot {
                        if let postDict = snap.value as? [String: AnyObject] {
                            let transaction = HangMucChi (json: postDict)
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
    static func AddData(transactionModel: HangMucChi, completionHandler: @escaping (_ error: Error?) -> Void){
        ref = Database.database().reference()
        let user = User.uid
        let data = [
            "ten": transactionModel.title,
            "hinh": "default.png",
            
            
            ] as [String : Any]
        
        ref?.child("User").child(user!).child("chi").childByAutoId().setValue(data, withCompletionBlock: { (error, ref) in
            completionHandler(error)
        })
    }
}
