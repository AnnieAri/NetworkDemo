//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  GitHub: https://github.com/AnnieAri
//  RequestProtocol.swift 
//  NetworkDemo 
// 
//  Created by AriSwift on 2019/4/22. 
//  Copyright © 2019 AriSwift. All rights reserved. 	
// 

import Foundation
import HandyJSON
public protocol RequestProtocol: HandyJSON {
    static func request(api: API, params: [String: Any]?, result: ((ResponseResult<Self>)->())?)
}

public extension RequestProtocol where Self: HandyJSON {
    static func request(api: API, params: [String: Any]?, result: ((ResponseResult<Self>)->())?) {
        let completionHandle: ((Result<Data,Error>)->()) = { res in
            switch res {
            case .success(let data):
                let jsonStr = String(data: data, encoding: .utf8)
                #if DEBUG
                print("url: \(api.path)")
                print("response:")
                print(jsonStr ?? "")
                #endif
                ///不是 json 数据,抛出 json 解析失败错误
                guard let jsonObj = self.self.deserialize(from: jsonStr) else {
                    result?(.failure(.deserializeFailed))
                    return
                }
                result?(.success(jsonObj))
            case .failure(_):
                ///处理错误 抛出去
                result?(.failure(.requestFailed))
            }
        }
        if api.method == .post {
            NetworkManager.shared.post(path: api.path, params: params, result: completionHandle)
        }else{
            NetworkManager.shared.get(path: api.path, params: params, result: completionHandle)
        }
    }
}

