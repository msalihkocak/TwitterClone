//
//  Cells.swift
//  TwitterClone
//
//  Created by Mehmet Salih Koçak on 18.11.2018.
//  Copyright © 2018 Mehmet Salih Koçak. All rights reserved.
//

import LBTAComponents

class UserHeader: DatasourceCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let seperator: UIView = {
        let view = UIView()
        view.backgroundColor = .seperator
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        addSubview(textLabel)
        addSubview(seperator)
        
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        seperator.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
    }
}

class UserFooter: DatasourceCell {
    
    let showMeMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show me more", for: .normal)
        button.tintColor = UIColor.followButton
        button.contentHorizontalAlignment = .left
        button.backgroundColor = .white
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(showMeMoreButton)
        
        showMeMoreButton.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
