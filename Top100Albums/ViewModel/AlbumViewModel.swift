//
//  AlbumViewModel.swift
//  Top100Albums
//
//  Created by Gabriel on 15/01/2021.
//  Copyright © 2021 Gabriel Quispe Delgadillo. All rights reserved.
//

import Foundation
import UIKit

class AlbumViewModel {
    private let album: Album
    private let imageService: ImageService
    
    var imageStorage: UIImage? = nil

    var onPosterUpdated: ((AlbumViewModel) -> Void)? = nil
    var indexPath: IndexPath?

    init(album: Album, imageService: ImageService) {
        self.album = album
        self.imageService = imageService
    }
    
    var title: String {
        return album.name
    }
    
    var artistName: String {
        return album.artistName
    }
    
    var url: URL? {
        let modifiedString = album.url.replacingOccurrences(of: "music.apple.com", with: "geo.itunes.apple.com")
        var modifiedURL = URL.init(string: modifiedString)
        guard let aux = modifiedURL?.lastPathComponent else { return nil }
        modifiedURL?.deleteLastPathComponent()
        modifiedURL?.appendPathComponent("id\(aux)")

        return modifiedURL
    }
    
    private var thumbnailURL: URL? {
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
    
    func fetchImage() {
        guard let url = thumbnailURL else { return }
        imageService.fetchImage(imageURL: url) { [weak self] (result) in
            guard let sself = self else { return }
            switch result {
            case .success(let image):
                sself.imageStorage = image
            case .failure(let error):
                print(error.message)
            }
            
            sself.onPosterUpdated?(sself)
        }
    }
}
