//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  GitHub: https://github.com/AnnieAri
//  NetworkManager.swift 
//  NetworkDemo 
// 
//  Created by AriSwift on 2019/4/22. 
//  Copyright © 2019 AriSwift. All rights reserved. 	
// 

import Foundation
import Moya

private struct Target: TargetType {
    init(request: Requset) {
        self.request = request
    }
    var request: Requset
    var baseURL: URL {
        return URL(string: request.baseURL)!
    }
    var path: String {
        return request.path
    }
    
    var method: Moya.Method {
        return request.method == .post ? .post : .get
    }
    
    var sampleData: Data = "".data(using: .utf8)!
    
    var task: Task {
        return .requestParameters(parameters: request.parameters, encoding: URLEncoding.default)
    }
    var headers: [String : String]? {
        return ["Content-Type":"application/x-www-form-urlencoded"]
    }
}

class NetworkManager {
    static let shared = NetworkManager("")
    init(_ baseURL: String = "") {
        self.baseUrl = baseURL
    }
    var baseUrl = ""
    func post(path: String,params: [String: Any]?,result: @escaping ((Result<Data,Error>)->())){
        let request = Requset(baseURL:baseUrl, path: path, parameters: params)
        let target = Target(request: request)
        self.request(target: target, result: result)
    }
    func get(path: String,params: [String: Any]?,result: @escaping ((Result<Data,Error>)->())){
        let request = Requset(baseURL:baseUrl, path: path, parameters: params)
        let target = Target(request: request)
        self.request(target: target, result: result)
    }
    private func request(target: Target,result: @escaping ((Result<Data,Error>)->())) {
        MoyaProvider<Target>().request(target) { (res) in
            switch res {
            case .success(let a):
                result(.success(a.data))
            case .failure:
                result(.failure(res.error!))
            }
        }
    }
}
