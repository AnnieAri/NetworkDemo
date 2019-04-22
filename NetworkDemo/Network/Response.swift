//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  GitHub: https://github.com/AnnieAri
//  Response.swift 
//  NetworkDemo 
// 
//  Created by AriSwift on 2019/4/22. 
//  Copyright © 2019 AriSwift. All rights reserved. 	
// 
import HandyJSON
import Foundation

public struct DataResponse<T>: RequestProtocol where T: HandyJSON {
    public init (){}
    public var code: Int = -1
    public var msg: String = ""
    public var data: T?
}
public struct ListResponse<T>: RequestProtocol where T: HandyJSON {
    public init (){}
    public var code: Int = -1
    public var msg: String = ""
    public var data: [T] = []
}
public struct MsgResponse:  RequestProtocol {
    public init (){}
    public var code: Int = -1
    public var msg: String = ""
    public var data: String?
}
