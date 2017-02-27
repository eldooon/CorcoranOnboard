//
//  MenuItems.swift
//  OnBoardCorcoran
//
//  Created by Eldon Chan on 2/13/17.
//  Copyright © 2017 Eldon. All rights reserved.
//

import UIKit

public class MenuItem {
    
    var menuImage = UIImage()
    var menuName = String()
    
    init(Image: UIImage, Name: String){
        
        menuImage  = Image
        menuName = Name
    }
    
}

class MenuLauncherItems {
    
    var menuItems = [MenuItem(Image: AgentSuiteStyle.imageOfItem, Name: "Corcoran"), MenuItem(Image: AgentSuiteStyle.imageOfItem, Name: "Taxi"), MenuItem(Image: AgentSuiteStyle.imageOfItem, Name: "eCorcoran"), MenuItem(Image: AgentSuiteStyle.imageOfItem, Name: "Listings"), MenuItem(Image: AgentSuiteStyle.imageOfItem, Name: "Helpdesk"), MenuItem(Image: AgentSuiteStyle.imageOfItem, Name: "ORDER PIZZA")]
    
    func generateMenuItems() {
        
        var menuItems = [MenuItem]()
        let item1 = MenuItem(Image: AgentSuiteStyle.imageOfItem, Name: "Menu Item")
        let item2 = MenuItem(Image: AgentSuiteStyle.imageOfItem, Name: "Menu Item")
        let item3 = MenuItem(Image: AgentSuiteStyle.imageOfItem, Name: "Menu Item")
        let item4 = MenuItem(Image: AgentSuiteStyle.imageOfItem, Name: "Menu Item")
        let item5 = MenuItem(Image: AgentSuiteStyle.imageOfItem, Name: "Menu Item")
        
        menuItems.append(item1)
        menuItems.append(item2)
        menuItems.append(item3)
        menuItems.append(item4)
        menuItems.append(item5)
        
    }
}
