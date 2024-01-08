//
//  SelectedCell.swift
//  Theme-App
//
//  Created by Kiyaan M Singh on 06/01/24.
//

import UIKit

class SelectedCell: UICollectionViewCell {
    var wallpaperImg: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        wallpaperImg = UIImageView(frame: contentView.bounds)
        wallpaperImg.contentMode = .scaleAspectFill
        wallpaperImg.translatesAutoresizingMaskIntoConstraints = false
        wallpaperImg.layer.cornerRadius = 25
        wallpaperImg.layer.masksToBounds = true
        contentView.addSubview(wallpaperImg)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
