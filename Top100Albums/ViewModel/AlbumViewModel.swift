//
//  AlbumViewModel.swift
//  Top100Albums
//
//  Created by Gabriel on 15/01/2021.
//  Copyright © 2021 Gabriel Quispe Delgadillo. All rights reserved.
//

import Foundation

class AlbumViewModel {
    private let album: Album

    init(album: Album) {
        self.album = album
    }
    
    var title: String {
        return album.name
    }
    
    var artistName: String {
        return album.artistName
    }
    
    var artistURL: URL? {
        return URL.init(string: album.artistUrl)
    }
    
    var thumbnailURL: URL? {
        return URL.init(string: album.artworkUrl100)
    }
    
    var releaseDate: String {
        return album.releaseDate
    }
    
    var genres: [String] {
        return album.genres.map({$0.name})
    }
    
    var copyright: String {
        return album.copyright
    }
}
