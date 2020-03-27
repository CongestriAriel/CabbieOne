//
//  Routeable.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 26/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import Foundation
import Alamofire

protocol Routeable {
    var baseUrl: String { get }

    var path: String { get }
    
    var method: HTTPMethod { get }
    
    var encoding: ParameterEncoding { get }
    
    var parameters: Parameters? { get }
}

struct MoviesSearch: Routeable {
    var baseUrl: String {
        return "https://swapi.co/api"
    }
    
    var path: String {
        return "/films/"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var parameters: Parameters? {
        return nil
    }
}

struct PeopleSearch: Routeable {
    private var page: Int

    init(page: Int) {
        self.page = page
    }
    var baseUrl: String {
        return "https://swapi.co/api"
    }
    
    var path: String {
        return "/people/"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var parameters: Parameters? {
        return ["page": page]
    }
}

