//
//  getDataThu.swift
//  Money_Save
//
//  Created by NhatDuy on 7/8/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import Foundation
import FirebaseDatabase

class GetDataThu {
    static var ref : DatabaseReference?
    
    static func getData(completionHandler: @escaping (_ thus: [Muc]?, _ error: String?) -> Void) {
        ref = Database.database().reference()
        var thus: [Muc] = []
        
        ref?.child("User").child(User.uid!).child("thu").observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.exists() {
                if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                    for snap in snapshot {
                        if let postDict = snap.value as? [String: AnyObject] {
                            let transaction = Muc (json: postDict)
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
    static func AddData(transactionModel: Muc, completionHandler: @escaping (_ error: Error?) -> Void){
        ref = Database.database().reference()
        let user = User.uid
        let data = [
            "ten_muc_thu": transactionModel.title,
            "tenhinh": transactionModel.image,
            
            
            ] as [String : Any]
        
        ref?.child("User").child(user!).child("thu").childByAutoId().setValue(data, withCompletionBlock: { (error, ref) in
            completionHandler(error)
        })
    }
}
