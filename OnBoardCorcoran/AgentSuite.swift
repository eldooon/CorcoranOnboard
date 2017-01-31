//
//  AgentSuite.swift
//  OnBoardCorcoran
//
//  Created by Eldon Chan on 1/27/17.
//  Copyright © 2017 Eldon. All rights reserved.
//

import Foundation
import UIKit

public class Suite {
    
    var suiteImage = UIImage()
    var suiteName = String()
    var suiteBody1 = String()
    var suiteBody2 = String()
    var suiteBody3 = String()
    var suiteBodyLast = String()
    
    init(Image: UIImage, Name: String, body1: String, body2: String, body3: String, bodyLast: String){
        
        suiteImage = Image
        suiteName = Name
        suiteBody1 = body1
        suiteBody2 = body2
        suiteBody3 = body3
        suiteBodyLast = bodyLast
        
    }
    
}

class SuiteData {
    
    var suiteData = [Suite]()
    
    let taxiData = Suite(Image: AgentSuiteStyle.imageOfTaxi, Name: "Taxi", body1: "Taxi Info", body2: "Taxi Info", body3: "Taxi Info", bodyLast: "Taxi Info")
    let spacioData = Suite(Image: AgentSuiteStyle.imageOfSpacio, Name: "Spacio", body1: "Spacio Info", body2: "Spacio Info", body3: "Spacio Info", bodyLast: "Spacio Info")
    
    func generateSuiteData() {
        
        suiteData.append(taxiData)
        suiteData.append(spacioData)
    }
}


