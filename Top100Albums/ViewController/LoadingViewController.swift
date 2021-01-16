//
//  LoadingViewController.swift
//  Top100Albums
//
//  Created by Gabriel on 15/01/2021.
//  Copyright © 2021 Gabriel Quispe Delgadillo. All rights reserved.
//

import Foundation
import UIKit

class LoadingViewController: UIViewController {
    private lazy var activityIndicator = UIActivityIndicatorView(style: .medium)
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
        self.view.backgroundColor = UIColor.white
        self.activityIndicator.startAnimating()
    }
    
}
