//
//  Album.swift
//  Top100Albums
//
//  Created by Gabriel on 15/01/2021.
//  Copyright © 2021 Gabriel Quispe Delgadillo. All rights reserved.
//

import Foundation

struct Album: Decodable {
    let artistName: String
    let name: String
    let artworkUrl100: String
    let releaseDate: String
    let copyright: String
    let genres: [Genre]
    let url: String
}

struct Genre: Decodable {
    let name: String
}

struct AlbumResult: Decodable {
    let feed: AlbumFeed
}

struct AlbumFeed: Decodable {
    let results: [Album]
}
