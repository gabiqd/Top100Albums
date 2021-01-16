//
//  AlbumListTableViewCell.swift
//  Top100Albums
//
//  Created by Gabriel on 15/01/2021.
//  Copyright © 2021 Gabriel Quispe Delgadillo. All rights reserved.
//

import Foundation
import UIKit

class AlbumListTableViewCell: UITableViewCell {
    lazy private var albumTitleLabel: UILabel = {
        let albumTitleLabel = UILabel()
        albumTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        albumTitleLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        albumTitleLabel.textColor = UIColor.black
        albumTitleLabel.textAlignment = .left
        albumTitleLabel.numberOfLines = 0
        albumTitleLabel.lineBreakMode = .byWordWrapping
        return albumTitleLabel
    }()
    
    lazy private var artistLabel: UILabel = {
        let artistLabel = UILabel()
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .light)
        artistLabel.textColor = UIColor.darkGray
        artistLabel.textAlignment = .left
        artistLabel.numberOfLines = 0
        artistLabel.lineBreakMode = .byWordWrapping
        return artistLabel
    }()
    
    lazy private var albumArtImageView: UIImageView = {
        let albumArtImageView = UIImageView()
        albumArtImageView.translatesAutoresizingMaskIntoConstraints = false
        albumArtImageView.contentMode = .scaleAspectFill
        albumArtImageView.clipsToBounds = true
        albumArtImageView.layer.masksToBounds = true

        return albumArtImageView
    }()
    
    lazy private var cardView: CardView = {
        let cardView = CardView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .black
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
        self.addSubview(cardView)
        cardView.addSubview(albumTitleLabel)
        cardView.addSubview(artistLabel)
        cardView.addSubview(albumArtImageView)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            albumTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 12.0),
            albumTitleLabel.leadingAnchor.constraint(equalTo: albumArtImageView.trailingAnchor, constant: 12.0),
            albumTitleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -12.0),
            albumTitleLabel.bottomAnchor.constraint(equalTo: artistLabel.topAnchor, constant: -8)
        ])
        
        
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: albumTitleLabel.bottomAnchor, constant: 8.0),
            artistLabel.leadingAnchor.constraint(equalTo: albumArtImageView.trailingAnchor, constant: 12.0),
            artistLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -12.0),
            artistLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            albumArtImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12.0),
            albumArtImageView.trailingAnchor.constraint(equalTo: albumTitleLabel.leadingAnchor, constant: -12.0),
            albumArtImageView.topAnchor.constraint(greaterThanOrEqualTo: cardView.topAnchor, constant: 12.0),
            albumArtImageView.bottomAnchor.constraint(lessThanOrEqualTo: cardView.bottomAnchor, constant: -12.0),
            albumArtImageView.heightAnchor.constraint(equalToConstant: 36.0),
            albumArtImageView.widthAnchor.constraint(equalToConstant: 36.0)
        ])
        
    }
    
    func setAlbumInfo(title: String, artistName: String, albumURL: URL?) {
        albumTitleLabel.text = title
        artistLabel.text = artistName
    }
}
