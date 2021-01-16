//
//  AlbumListViewModel.swift
//  Top100Albums
//
//  Created by Gabriel on 15/01/2021.
//  Copyright © 2021 Gabriel Quispe Delgadillo. All rights reserved.
//

import Foundation
import UIKit

class AlbumListViewModel: NSObject {
    let networkService: AlbumService
    private(set) var albumsViewModels: [AlbumViewModel] = []
    var onAlbumsListUpdated: ((AlbumListViewModel) -> Void)? = nil

    init(networkService: AlbumService) {
        self.networkService = networkService
        super.init()
        
        self.fetch()
    }
    
    func fetch() {
        networkService.fetchAlbums { [weak self] (result) in
            guard let sself = self else { return }

            switch result {
            case .success(let response):
                let albumsViewModels = response.feed.results.map { AlbumViewModel(album: $0) }
                sself.albumsViewModels = albumsViewModels
                sself.onAlbumsListUpdated?(sself)
            case .failure(let error):
                print(error.message)
            }
        }
    }
}
