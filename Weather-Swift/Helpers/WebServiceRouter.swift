//
//  WebServiceRouter.swift
//  Weather-Swift
//
//  Created by zdq on 29/3/17.
//  Copyright © 2017 zdq. All rights reserved.
//

import Foundation

import Alamofire
import SVProgressHUD

let baseURLString = WebService.host + WebService.apiKey

public enum URLType{
    
    case path
    
}

enum BackendError: Error {
    case network(error: Error) // Capture any underlying Error from the URLSession API
    case dataSerialization(error: Error)
    case jsonSerialization(error: Error)
    case xmlSerialization(error: Error)
    case objectSerialization(reason: String)
}

@discardableResult
public func webServiceRequest(
    urlType: URLType = .path,
    url: String,
    method: HTTPMethod = .get,
    parameters: Parameters? = nil,
    completionHandler: @escaping ([String : Any]) -> Void){
    
    var urlString = baseURLString
    
    urlString = urlString + url + "?units=si"
    
    urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    
    SVProgressHUD.show()
    Alamofire.request(urlString, method: method, parameters: parameters).responseJSON { response in
        debugPrint(response)
        
        SVProgressHUD.dismiss()
        
        guard response.result.isSuccess else {
            SVProgressHUD.showError(withStatus: "load fail...")
            return
        }
        
        if let JSON = response.result.value {
            completionHandler(JSON as! [String : Any])
        }
    }
}
