//
//  NetworkEndopoints.swift
//  Top100Albums
//
//  Created by Gabriel on 15/01/2021.
//  Copyright © 2021 Gabriel Quispe Delgadillo. All rights reserved.
//

import Foundation

enum Endpoints {
    case albums
    
    var url: URL?{
        let host = "rss.itunes.apple.com"
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        
        switch self {
        case .albums:
            components.path = "/api/v1/us/apple-music/top-albums/all/100/explicit.json"
        }
        
        return components.url
    }
    
    var httpMethod: String {
        switch self {
        case .albums:
            return "GET"
        }
    }
}
