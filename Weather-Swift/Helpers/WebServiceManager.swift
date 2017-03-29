//
//  WebServiceManager.swift
//  Weather-Swift
//
//  Created by zdq on 29/3/17.
//  Copyright © 2017 zdq. All rights reserved.
//

import Alamofire
import SVProgressHUD

class WebServiceManager: NSObject {

    static let shareWebServiceManager = WebServiceManager()

    func getWeather(locationStr:String, finished:@escaping ([String:Any])->()) {
        
        webServiceRequest(url: locationStr,
                          method:.get,
                          parameters:nil,
                          completionHandler:{ response in
                            print("response")
                            print(response)
                            finished(response)
        })
        
    }
}
