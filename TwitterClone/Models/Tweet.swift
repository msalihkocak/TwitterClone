//
//  Tweet.swift
//  TwitterClone
//
//  Created by Mehmet Salih Koçak on 19.11.2018.
//  Copyright © 2018 Mehmet Salih Koçak. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Tweet: JSONDecodable {
    
    let message:String
    var user:User
    var image:Image
    let replyCount:Int
    let favCount:Int
    let retweetCount:Int
    
    init(json: JSON) {
        message = json["message"].stringValue
        user = User(json: json["user"])
        image = Image(json: json["image"])
        replyCount = 0
        favCount = 0
        retweetCount = 0
    }
}

struct Image :JSONDecodable{
    let width:Int
    let height:Int
    let imageUrl:String
    
    init(json: JSON) {
        width = json["width"].intValue
        height = json["height"].intValue
        imageUrl = json["imageUrl"].stringValue
    }
}

