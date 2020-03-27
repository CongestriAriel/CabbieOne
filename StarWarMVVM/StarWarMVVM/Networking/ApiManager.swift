//
//  ApiManager.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 26/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

class APIManager {
    static func request(withRouteable routeable: Routeable) -> Promise<Data> {
        return Promise { seal in
            Alamofire.request(routeable.baseUrl + routeable.path, method: routeable.method, parameters: routeable.parameters, encoding: routeable.encoding).validate().responseJSON { response in
                switch response.result {
                case .success:
                    guard let value = response.data else { return }
                    seal.fulfill(value)
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
    }

    static func executeMultipleRequest(withRouteables routeables: [Routeable]) -> Promise<[Data]> {
        return Promise { seal in
            var returnable = [Data]()
            routeables.forEach { (routeable) in
                request(withRouteable: routeable).done { (data) in
                    returnable.append(data)
                    if returnable.count == routeables.count {
                        seal.fulfill(returnable)
                    }
                }.catch { (error) in
                    seal.reject(error)
                }
            }
        }
    }
    
}
