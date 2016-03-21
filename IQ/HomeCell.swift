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
    
    func updateUI(dictionary: NSDictionary) {
        backgroundColor = randomColor(hue: .Random, luminosity: .Light)
        let imageURL = NSURL(string: IQImageURLString(dictionary.allKeys.first as! String))!
        
        imageView.sd_setImageWithURL(imageURL, placeholderImage: UIImage(named: "default")) //必须要设置一张占位图，不然坑的一笔
        
        label.text = dictionary.allValues.first as? String
    }
}
