//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Mehmet Salih Koçak on 18.11.2018.
//  Copyright © 2018 Mehmet Salih Koçak. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource{
    
    let users: [User] = {
        let me = User(name: "Mehmet Salih Koçak", username: "@msalihkocak", bioText: "Ödevini icra etmeye çalışan bir insan.", imageName: "profile_image")
        let otherUser = User(name: "Brian Voong", username: "@letsbuildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn build iOS Apps.", imageName: "brian_pp")
        return [me, otherUser]
    }()
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
}
