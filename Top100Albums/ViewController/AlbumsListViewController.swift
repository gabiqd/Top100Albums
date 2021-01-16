//
//  AlbumsListViewController.swift
//  Top100Albums
//
//  Created by Gabriel on 15/01/2021.
//  Copyright © 2021 Gabriel Quispe Delgadillo. All rights reserved.
//

import UIKit

class AlbumsListViewController: UITableViewController {
    private let cellID = "albumCellID"
    private let loadingViewController = LoadingViewController()
    
    lazy private(set) var viewModel: AlbumListViewModel = {
        let service = NetworkService()
        let viewModel = AlbumListViewModel(networkService: service)
        return viewModel
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Top 100 Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = {
            let tableView = UITableView()
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.register(AlbumListTableViewCell.self, forCellReuseIdentifier: cellID)
            tableView.backgroundColor = .black
            
            return tableView
        }()
        
        add(loadingViewController)
        
        viewModel.onAlbumsListUpdated = { [weak self] viewModel in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.loadingViewController.remove()
            }
        }
        
    }

}


// UITableViewDelegate
extension AlbumsListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let detailsViewController = AlbumDetailsViewController(with: viewModel.albumsViewModels[indexPath.row])
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

// UITableViewDataSource
extension AlbumsListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.albumsViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? AlbumListTableViewCell else {
            fatalError()
        }
        
        let currentAlbum = viewModel.albumsViewModels[indexPath.row]
        
        cell.setAlbumInfo(title: currentAlbum.title, artistName: currentAlbum.artistName, albumURL: currentAlbum.thumbnailURL)
        
        return cell
    }
    
    
}
