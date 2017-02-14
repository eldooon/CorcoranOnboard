//
//  MoreMenuLauncher.swift
//  OnBoardCorcoran
//
//  Created by Eldon Chan on 2/9/17.
//  Copyright © 2017 Eldon. All rights reserved.
//

import UIKit

class MoreMenuLauncher : NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var darkenView = UIView()
    var menuCollectionView : UICollectionView = {
        let layout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    let menuItems = MenuLauncherItems()
    
    override init() {
        super.init()
        
        menuItems.generateMenuItems()
        setUpMenuCollectionCells()
    }
    
    func showMenu() {
        
        if let window = UIApplication.shared.keyWindow {
           
            window.addSubview(darkenView)
            darkenView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            darkenView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissLauncher)))
            darkenView.frame = window.frame
            darkenView.alpha = 0
            
            window.addSubview(menuCollectionView)
            let width : CGFloat = 400
            let x =  width - window.frame.width
            menuCollectionView.frame = CGRect(x: -window.frame.width, y: 0 , width: window.frame.width, height:window.frame.height)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.darkenView.alpha = 1
                self.menuCollectionView.frame = CGRect(x: x, y: 0 , width: window.frame.width/2, height: self.menuCollectionView.frame.height)
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return menuItems.menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath) as! MenuLauncherCollectionViewCell
        
        cell.itemImageView.image = menuItems.menuItems[indexPath.item].menuImage
        cell.itemLabel.text = menuItems.menuItems[indexPath.item].menuName
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
    }
    
    
    func setUpMenuCollectionCells() {
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        //setup Layout
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        layout.itemSize = CGSize(width: screenWidth/2.005, height: screenWidth/5)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 0
        
        menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        menuCollectionView.register(MenuLauncherCollectionViewCell.self, forCellWithReuseIdentifier: "basicCell")
        menuCollectionView.showsVerticalScrollIndicator = false
        menuCollectionView.showsHorizontalScrollIndicator = false
        menuCollectionView.contentInset = UIEdgeInsets(top: 100, left: 10, bottom: 0, right: 0)
        
    }
    
    
    

    
}
