//
//  User.swift
//  TwitterClone
//
//  Created by Mehmet Salih Koçak on 19.11.2018.
//  Copyright © 2018 Mehmet Salih Koçak. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct User: JSONDecodable {
    
    let id:Int
    let name:String
    let username:String
    let bio:String
    let profileImageUrl:String
    
    init(json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
        username = json["username"].stringValue
        bio = json["bio"].stringValue
        profileImageUrl = json["profileImageUrl"].stringValue
    }
}

class JSONError : JSONDecodable {
    var errors: [String:[String]] = [:]
    
    required init(json: JSON) throws {
        print("JSON fail")
    }
}
