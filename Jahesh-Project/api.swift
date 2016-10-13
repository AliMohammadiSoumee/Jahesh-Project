//
//  api.swift
//  shop-alamo-api
//
//  Created by puria kordrostami on 10/6/16.
//  Copyright © 2016 puria kordrostami. All rights reserved.
//

import Foundation
import Alamofire

class api {
    let path, userPass, base64UserPass : String
    let userPassData : Data
    let headers: HTTPHeaders
    init(user : String,pass : String) {
        self.path = "http://185.8.173.210/api/"
        self.userPass = "\(user):\(pass)"
        
        self.userPassData = userPass.data(using: String.Encoding.utf8)!
        self.base64UserPass = "Basic " + userPassData.base64EncodedString()
        self.headers = [
            "Authorization": base64UserPass,
            "Accept": "application/json"
        ]
    }
    func get_cat(id: Int? ) {
        if let Uid = id {
            let qpath = self.path + "category/?" + String(Uid)
            Alamofire.request(qpath, headers: headers).response { response in
                print("Request: \(response.request)")
                print("Response: \(response.response)")
                print("Error: \(response.error)")
                if let data = response.data {
                    print(data)
                }
            }
        }
    }
}












