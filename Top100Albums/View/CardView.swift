//
//  CardView.swift
//  Top100Albums
//
//  Created by Gabriel on 15/01/2021.
//  Copyright © 2021 Gabriel Quispe Delgadillo. All rights reserved.
//

import Foundation
import UIKit

class CardView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 14
        self.layer.masksToBounds = true
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

