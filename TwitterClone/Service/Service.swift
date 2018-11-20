//
//  Service.swift
//  TwitterClone
//
//  Created by Mehmet Salih Koçak on 20.11.2018.
//  Copyright © 2018 Mehmet Salih Koçak. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: Constants.apiBaseAddress)
    
    static let shared = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource?, Error?) -> ()){
        
        let request:APIRequest<HomeDatasource, JSONError> = tron.swiftyJSON.request("/twitter/home")
        request.perform(withSuccess: { (home) in
            completion(home, nil)
        }) { (error) in
            print("Request error", error.localizedDescription)
            completion(nil, error)
        }
    }
}
