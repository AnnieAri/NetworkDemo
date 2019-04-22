//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  GitHub: https://github.com/AnnieAri
//  Request.swift 
//  NetworkDemo 
// 
//  Created by AriSwift on 2019/4/22. 
//  Copyright © 2019 AriSwift. All rights reserved. 	
// 

import Foundation
enum RequestMethod {
    case post
    case get
}
struct Requset {
    init(method: RequestMethod = .post, baseURL: String = "", path: String, parameters: [String : Any]?){
        self.method = method
        self.baseURL = baseURL
        self.path = path
        self.parameters = parameters ?? [:]
    }
    var method: RequestMethod
    var baseURL: String
    var path: String
    var parameters: [String: Any]
}
