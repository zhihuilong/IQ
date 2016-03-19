//
//  HomeCell.swift
//  IQ
//
//  Created by Sunny on 3/19/16.
//  Copyright © 2016 Sunny. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func updateUI(data: String) {
        self.backgroundColor = randomColor(hue: .Random, luminosity: .Light)
        imageView.image = UIImage(named: data)
        label.text = data;
    }
}
