//
//  MoreMenuLauncher.swift
//  OnBoardCorcoran
//
//  Created by Eldon Chan on 2/9/17.
//  Copyright © 2017 Eldon. All rights reserved.
//

import UIKit

class MoreMenuLauncher : NSObject {
    
    var darkenView = UIView()
    let menuCollectionView : UICollectionView = {
        let layout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    
    override init() {
        super.init()
    }
    
    func showMenu() {
        
        if let window = UIApplication.shared.keyWindow {
           
            window.addSubview(darkenView)
            darkenView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            darkenView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissLauncher)))
            darkenView.frame = window.frame
            darkenView.alpha = 0
            
            window.addSubview(menuCollectionView)
            let width : CGFloat = 200
            let x =  width - window.frame.width
            menuCollectionView.frame = CGRect(x: -window.frame.width, y: 0 , width: window.frame.width, height:window.frame.height)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.darkenView.alpha = 1
                self.menuCollectionView.frame = CGRect(x: x, y: 0 , width: window.frame.width, height: self.menuCollectionView.frame.height)
            })
        }
        
    }
    
    func dismissLauncher() {
        
        UIView.animate(withDuration: 0.5) {
            
            if let window = UIApplication.shared.keyWindow {
                self.darkenView.alpha = 0
                self.menuCollectionView.frame = CGRect(x: -window.frame.width, y: 0 , width: window.frame.width, height:window.frame.height)
            }
        }
    }
}
