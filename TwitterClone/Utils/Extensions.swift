//
//  Extensions.swift
//  TwitterClone
//
//  Created by Mehmet Salih Koçak on 19.11.2018.
//  Copyright © 2018 Mehmet Salih Koçak. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

extension UIColor{
    static let followButton = UIColor(r: 61, g: 167, b: 244)
    static let seperator = UIColor(r: 230, g: 230, b: 230)
    static let collectionViewBackground = UIColor(r: 232, g: 236, b: 241)
}

extension Collection where Iterator.Element == JSON{
    func decode<T: JSONDecodable>() throws -> [T]{
        return try map {try T(json: $0)}
    }
}
