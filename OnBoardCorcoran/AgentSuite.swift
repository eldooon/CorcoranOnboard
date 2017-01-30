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
    
    init(Image: UIImage, Name: String){
        
        suiteImage = Image
        suiteName = Name
        
    }
    
}

class SuiteData {
    
    var suiteData = [Suite]()
    
    let taxiData = Suite(Image: AgentSuiteStyle.imageOfTaxi, Name: "Taxi")
    let spacioData = Suite(Image: AgentSuiteStyle.imageOfSpacio, Name: "Spacio")
    
    func generateSuiteData() {
        
        suiteData.append(taxiData)
        suiteData.append(spacioData)
    }
}


