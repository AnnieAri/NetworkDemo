//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  GitHub: https://github.com/AnnieAri
//  API.swift 
//  NetworkDemo 
// 
//  Created by AriSwift on 2019/4/22. 
//  Copyright © 2019 AriSwift. All rights reserved. 	
// 

import Foundation
public struct API {
    var path: String
    var method: RequestMethod
    init(path: String, method: RequestMethod = .post) {
        self.path = path
        self.method = method
    }
}
