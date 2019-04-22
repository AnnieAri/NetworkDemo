//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  GitHub: https://github.com/AnnieAri
//  ViewController.swift 
//  NetworkDemo 
// 
//  Created by AriSwift on 2019/4/22. 
//  Copyright © 2019 AriSwift. All rights reserved. 	
// 

import UIKit

extension API {
    static let getBookDetail = API(path: "/v2/book/1220562")
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager("https://www.baidu.com").get(path: "", params: nil) { (res) in
            let data = try! res.get()
            print(String(data: data, encoding: .utf8))
        }
        
        NetworkManager.shared.baseUrl = "https://api.douban.com"
        BookResponse.request(api: .getBookDetail, params: nil) { (res) in
            guard res.isSuccess else { return }
            print(res.value?.toJSON())
        }
        
        
    }


}

