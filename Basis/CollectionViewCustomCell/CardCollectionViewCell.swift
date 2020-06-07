//
//  CardCollectionViewCell.swift
//  Basis
//
//  Created by GAURAV NAYAK on 07/06/20.
//  Copyright © 2020 CaffeineDevotee. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var messageLabel: UILabel!
    
    func updateCell() {
        self.layer.cornerRadius = 10
        self.layer.backgroundColor = getRandomColor().cgColor
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        self.layer.shadowRadius = 20.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
    }
}
