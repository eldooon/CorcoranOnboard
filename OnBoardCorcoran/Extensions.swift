//
//  Extensions.swift
//  OnBoardCorcoran
//
//  Created by Eldon Chan on 1/30/17.
//  Copyright © 2017 Eldon. All rights reserved.
//

import UIKit

extension UINavigationController {
    func pop(animated: Bool) {
        _ = self.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool) {
        _ = self.popToRootViewController(animated: animated)
    }
}
