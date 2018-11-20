//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Mehmet Salih Koçak on 18.11.2018.
//  Copyright © 2018 Mehmet Salih Koçak. All rights reserved.
//

import LBTAComponents
import SwiftyJSON
import TRON

class HomeDatasource: Datasource, JSONDecodable{
    
    var users:[User]
    var tweets:[Tweet]
    
    required init(json: JSON) throws {
        users = [User]()
        tweets = [Tweet]()
        
        guard let usersArray = json["users"].array, let tweetsArray = json["tweets"].array else{
            throw NSError(domain: "com.msalihkocak", code: 1, userInfo: [NSLocalizedDescriptionKey: "users json is not valid."])
        }
        
        self.users = try usersArray.decode()
        self.tweets = try tweetsArray.decode()
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return indexPath.section == 0 ? users[indexPath.item] : tweets[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return section == 0 ? users.count : tweets.count
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
}
