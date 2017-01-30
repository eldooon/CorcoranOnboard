//
//  AgentSuiteCollectionViewCell.swift
//  OnBoardCorcoran
//
//  Created by Eldon Chan on 1/27/17.
//  Copyright © 2017 Eldon. All rights reserved.
//

import UIKit
import SnapKit

class AgentSuiteCollectionViewCell: UICollectionViewCell {
    
    var agentSuiteImageView = UIImageView()
    var agentSuiteLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(agentSuiteImageView)
        agentSuiteImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView.snp.centerY)
            make.centerX.equalTo(contentView.snp.centerX)
            make.height.equalTo(contentView.snp.height).dividedBy(1.25)
            make.width.equalTo(contentView.snp.width).dividedBy(1.25)
        }
        
        
        contentView.addSubview(agentSuiteLabel)
        agentSuiteLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.bottom).offset(10)
            make.centerX.equalTo(contentView.snp.centerX)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

