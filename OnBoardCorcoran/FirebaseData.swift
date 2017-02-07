//
//  FirebaseData.swift
//  OnBoardCorcoran
//
//  Created by Eldon Chan on 2/5/17.
//  Copyright © 2017 Eldon. All rights reserved.
//

import FirebaseDatabase

class FirebaseData {
    
    var firebaseData = [Suite]()
    let ref = FIRDatabase.database().reference(withPath: "AgentSuite")
    
    func retrieveData() {
        
        ref.observe(.value, with: { (snapshot) in
            
            for item in snapshot.children {
                print(item)
                let suite = Suite(snapshot: item as! FIRDataSnapshot)
                self.firebaseData.append(suite)
                dump("COUNT \(self.firebaseData)")
            }
        })
        
    }
    
    
    
}
