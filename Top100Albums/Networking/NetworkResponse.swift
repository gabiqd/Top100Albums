//
//  NetworkResponse.swift
//  Top100Albums
//
//  Created by Gabriel on 15/01/2021.
//  Copyright © 2021 Gabriel Quispe Delgadillo. All rights reserved.
//

import Foundation

struct NetworkResponse {
    fileprivate var data: Data
    init(data: Data){
        self.data = data
    }
}

extension NetworkResponse {
    public func decode<T: Decodable>(_ type: T.Type) -> T? {
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(T.self, from: data)
            return response
        } catch _ {
            return nil
        }
    }
}
