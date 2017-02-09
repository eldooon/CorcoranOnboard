//
//  AgentSuite.swift
//  OnBoardCorcoran
//
//  Created by Eldon Chan on 1/27/17.
//  Copyright © 2017 Eldon. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

public class Suite {
    
    var suiteImage = UIImage()
    var suiteName = String()
    var suiteBody1 = String()
    var suiteBody2 = String()
    var suiteBody3 = String()
    var suiteBodyLast = String()
    let ref: FIRDatabaseReference?
    
    init(Image: UIImage, Name: String, body1: String, body2: String, body3: String, bodyLast: String){
        
        suiteImage = Image
        suiteName = Name
        suiteBody1 = body1
        suiteBody2 = body2
        suiteBody3 = body3
        suiteBodyLast = bodyLast
        ref = nil
        
    }
    
    init(snapshot: FIRDataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        suiteName = snapshotValue["SuiteName"] as! String
        suiteBody1 = snapshotValue["SuiteBody1"] as! String
        suiteBody2 = snapshotValue["SuiteBody2"] as! String
        suiteBody3 = snapshotValue["SuiteBody3"] as! String
        suiteBodyLast = snapshotValue["SuiteBodyLast"] as! String
        suiteImage = Suite.agentSuiteImage(suiteName: suiteName)
        ref = snapshot.ref
    }
    
   private class func agentSuiteImage(suiteName : String) -> UIImage {
        
        switch suiteName {
        case "Taxi":
            return AgentSuiteStyle.imageOfTaxi
        case "Spacio":
            return AgentSuiteStyle.imageOfSpacio
        case "Marketing Center":
            return AgentSuiteStyle.imageOfMarketingCenter
        case "Contactually":
            return AgentSuiteStyle.imageOfContactually
        case "Lear":
            return AgentSuiteStyle.imageOfLear
        case "Vesta":
            return AgentSuiteStyle.imageOfVesta
        case "XpressDocs":
            return AgentSuiteStyle.imageOfXpressDocs
        default:
            return AgentSuiteStyle.imageOfTaxi
            
        }
    }
    
}

