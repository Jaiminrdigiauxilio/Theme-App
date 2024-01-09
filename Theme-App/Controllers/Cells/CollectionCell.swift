//
//  CollectionCell.swift
//  Theme-App
//
//  Created by Kiyaan M Singh on 03/01/24.
//

import UIKit


class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var wallpaperImg: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        wallpaperImg.image = nil
        wallpaperImg.image = UIImage(named: "placeholder")
    }
    
}

