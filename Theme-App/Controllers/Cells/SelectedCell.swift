//
//  SelectedCell.swift
//  Theme-App
//
//  Created by Kiyaan M Singh on 06/01/24.
//

import UIKit

class SelectedCell: UICollectionViewCell {
    
    @IBOutlet weak var wallpaperImg: UIImageView!
}
protocol tapDelegate:AnyObject {
    func didSelectItem(at Key: String)
}
