//
//  MenuLauncherCollectionViewCell.swift
//  OnBoardCorcoran
//
//  Created by Eldon Chan on 2/12/17.
//  Copyright © 2017 Eldon. All rights reserved.
//

import UIKit

class MenuLauncherCollectionViewCell: UICollectionViewCell {
    
    var itemImageView = UIImageView()
    var itemLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(itemImageView)
        itemImageView.snp.makeConstraints { (make) in
            make.left.equalTo(contentView.snp.left).offset(20)
            make.centerX.equalTo(contentView.snp.centerX)
            make.height.equalTo(contentView.snp.height).dividedBy(1.25)
            make.width.equalTo(contentView.snp.height).dividedBy(1.25)
        }
        
        
        contentView.addSubview(itemLabel)
        itemLabel.textColor = UIColor.white
        itemLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(itemImageView.snp.centerY)
            make.left.equalTo(itemImageView.snp.right).offset(10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
