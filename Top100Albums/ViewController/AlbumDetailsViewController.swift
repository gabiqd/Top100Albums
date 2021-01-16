//
//  AlbumDetailsViewController.swift
//  Top100Albums
//
//  Created by Gabriel on 15/01/2021.
//  Copyright © 2021 Gabriel Quispe Delgadillo. All rights reserved.
//

import Foundation
import UIKit

class AlbumDetailsViewController: ViewController {
    private var albumViewModel: AlbumViewModel
    
    lazy private var albumTitleLabel: UILabel = {
        let albumTitleLabel = UILabel()
        albumTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        albumTitleLabel.font = UIFont.systemFont(ofSize: 32.0, weight: .bold)
        albumTitleLabel.textColor = .white
        albumTitleLabel.textAlignment = .left
        albumTitleLabel.numberOfLines = 0
        albumTitleLabel.lineBreakMode = .byWordWrapping
        
        albumTitleLabel.text = albumViewModel.title
        
        return albumTitleLabel
    }()
    
    lazy private var artistLabel: UILabel = {
        let artistLabel = UILabel()
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.font = UIFont.systemFont(ofSize: 24.0, weight: .semibold)
        artistLabel.textColor = .white
        artistLabel.textAlignment = .left
        artistLabel.numberOfLines = 0
        artistLabel.lineBreakMode = .byWordWrapping
        
        artistLabel.text = albumViewModel.artistName
        
        return artistLabel
    }()
    
    lazy private var albumArtImageView: UIImageView = {
        let albumArtImageView = UIImageView()
        albumArtImageView.translatesAutoresizingMaskIntoConstraints = false
        albumArtImageView.contentMode = .scaleAspectFill
        albumArtImageView.clipsToBounds = true
        albumArtImageView.layer.masksToBounds = true
        
        if let albumURL = albumViewModel.thumbnailURL {
            let imageService = NetworkService()
            
            imageService.fetchImage(imageURL: albumURL) { [weak self] (result) in
                guard let sself = self else { return }

                switch result {
                case .success(let image):
                    DispatchQueue.main.async {
                        albumArtImageView.image = image
                    }
                case .failure(let error):
                    print(error.message)
                }
            }
        }
        
        return albumArtImageView
    }()
    
    lazy private var genresView: GenresView = {
        let genresView = GenresView(genres: albumViewModel.genres)
        genresView.translatesAutoresizingMaskIntoConstraints = false
        
        return genresView
    }()
    
    lazy private var releaseDateLabel: UILabel = {
        let releaseDateLabel = UILabel()
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .light)
        releaseDateLabel.textColor = .white
        releaseDateLabel.textAlignment = .left
        releaseDateLabel.numberOfLines = 0
        releaseDateLabel.lineBreakMode = .byWordWrapping
        
        releaseDateLabel.text = albumViewModel.releaseDate
        
        return releaseDateLabel
    }()
    
    lazy private var copyrightLabel: UILabel = {
        let copyrightLabel = UILabel()
        copyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        copyrightLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        copyrightLabel.textColor = .darkGray
        copyrightLabel.textAlignment = .center
        copyrightLabel.numberOfLines = 0
        copyrightLabel.lineBreakMode = .byWordWrapping
        
        copyrightLabel.text = albumViewModel.copyright
        
        return copyrightLabel
    }()
    
    lazy private var albumPageButton: StyledButton = {
        let albumPageButton = StyledButton()
        albumPageButton.translatesAutoresizingMaskIntoConstraints = false
        albumPageButton.setTitle("See Album Page", for: .normal)
        albumPageButton.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        
        return albumPageButton
    }()
    
    required init(with albumViewModel: AlbumViewModel) {
        self.albumViewModel = albumViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        self.view.addSubview(albumTitleLabel)
        self.view.addSubview(artistLabel)
        self.view.addSubview(albumArtImageView)
        self.view.addSubview(genresView)
        self.view.addSubview(releaseDateLabel)
        self.view.addSubview(copyrightLabel)
        self.view.addSubview(albumPageButton)
        
        NSLayoutConstraint.activate([
            albumArtImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8.0),
            albumArtImageView.bottomAnchor.constraint(equalTo: albumTitleLabel.topAnchor, constant: -24.0),
            albumArtImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            albumArtImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0)
        ])
        
        NSLayoutConstraint.activate([
            albumTitleLabel.topAnchor.constraint(equalTo: albumArtImageView.bottomAnchor, constant: 24.0),
            albumTitleLabel.bottomAnchor.constraint(equalTo: artistLabel.topAnchor, constant: -16.0),
            albumTitleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            albumTitleLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0)
        ])
        
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: albumTitleLabel.bottomAnchor, constant: 16.0),
            artistLabel.bottomAnchor.constraint(equalTo: genresView.topAnchor, constant: -16.0),
            artistLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            artistLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0)
        ])
        
        NSLayoutConstraint.activate([
            genresView.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 16.0),
            genresView.bottomAnchor.constraint(equalTo: releaseDateLabel.topAnchor, constant: -16.0),
            genresView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            genresView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            genresView.heightAnchor.constraint(equalToConstant: 32.0)
        ])
        
        NSLayoutConstraint.activate([
            releaseDateLabel.topAnchor.constraint(equalTo: genresView.bottomAnchor, constant: 16.0),
            releaseDateLabel.bottomAnchor.constraint(lessThanOrEqualTo: copyrightLabel.topAnchor, constant: -32.0),
            releaseDateLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            releaseDateLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0)
        ])
        
        NSLayoutConstraint.activate([
            copyrightLabel.topAnchor.constraint(greaterThanOrEqualTo: releaseDateLabel.bottomAnchor, constant: 32.0),
            copyrightLabel.bottomAnchor.constraint(equalTo: albumPageButton.topAnchor, constant: -24.0),
            copyrightLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            copyrightLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0)
        ])
        
        NSLayoutConstraint.activate([
            albumPageButton.topAnchor.constraint(equalTo: copyrightLabel.bottomAnchor, constant: 24.0),
            albumPageButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20.0),
            albumPageButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            albumPageButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0)
        ])
    }
    
    @objc func clickButton() {
        if let url = albumViewModel.artistURL {
           UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
