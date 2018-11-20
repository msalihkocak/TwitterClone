//
//  Home+navbar.swift
//  TwitterClone
//
//  Created by Mehmet Salih Koçak on 19.11.2018.
//  Copyright © 2018 Mehmet Salih Koçak. All rights reserved.
//

import UIKit

extension HomeDatasourceController{
    
    func setupNavBarItems(){
        setupLeftNavItem()
        setupRightNavItems()
        setupOtherNavItems()
        navigationController?.navigationBar.setNeedsLayout()
    }
    
    private func setupLeftNavItem(){
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.imageView?.contentMode = .scaleAspectFit
        followButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRightNavItems(){
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.imageView?.contentMode = .scaleAspectFit
        composeButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let composeBarButtonItem = UIBarButtonItem(customView: composeButton)
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.imageView?.contentMode = .scaleAspectFit
        searchButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let searchBarButtonItem = UIBarButtonItem(customView: searchButton)
        
        navigationItem.rightBarButtonItems = [composeBarButtonItem, searchBarButtonItem]
    }
    
    private func setupOtherNavItems(){
        let iconView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        iconView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        iconView.contentMode = .scaleAspectFit
        navigationItem.titleView = iconView
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

        let navBarSeperator = UIView()
        navBarSeperator.backgroundColor = .seperator

        view.addSubview(navBarSeperator)
        navBarSeperator.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
}
