//
//  APIClient.swift
//  KuruMaerabi_swift
//
//  Created by Nguyen Phuc Loc on 7/20/15.
//  Copyright (c) 2015 fabrica vietnam. All rights reserved.
//

import Foundation

class APIClient{
    var manager:AFHTTPRequestOperationManager?
    class var sharedInstance : APIClient {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : APIClient? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = APIClient()
        }
        return Static.instance!
    }
    
    init(){
        self.manager = AFHTTPRequestOperationManager()
    }
    
    func getImage(completed:(resObj:Array<String>) -> ()){
        self.manager?.GET(Url.images, parameters: nil, success: { (manager, response) -> Void in

            }, failure: { (manager, error) -> Void in
                
        })
    }
}