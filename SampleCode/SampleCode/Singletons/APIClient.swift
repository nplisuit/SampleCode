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
    
    func getImage(completed:(resObj:NSArray) -> ()){
        let methodArguments = [
            "method": "flickr.galleries.getPhotos",
            "api_key": "ac1cafbb552920263ceae93cbaeb42be",
            "gallery_id": "5704-72157622566655097",
            "extras": "url_m",
            "format": "json",
            "nojsoncallback": "1"
        ]
        self.manager?.GET(Url.images, parameters: methodArguments, success: { (manager, response) -> Void in
            let status = response.objectForKey("stat") as! String
            if( status == "ok"){
                let array:NSArray = response.objectForKey("photos")!.objectForKey("photo") as! NSArray
                completed(resObj: array)
            }

            }, failure: { (manager, error) -> Void in
                
        })
    }
}