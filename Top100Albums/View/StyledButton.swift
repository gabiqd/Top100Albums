//
//  StyledButton.swift
//  Top100Albums
//
//  Created by Gabriel on 15/01/2021.
//  Copyright © 2021 Gabriel Quispe Delgadillo. All rights reserved.
//

import Foundation
import UIKit

class StyledButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15);
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        
        setTitleColor(.black, for: .normal)
        setTitleColor(.white, for: .highlighted)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .black : .white
        }
    }
}
