//
//  TableCell.swift
//  Theme-App
//
//  Created by Kiyaan M Singh on 03/01/24.
//

import UIKit

class TableCell: UITableViewCell{
    @IBOutlet weak var homeCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        homeCollection.dataSource = self
        homeCollection.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension TableCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.collectionCellIdentifier, for: indexPath) as! CollectionCell
        cell.wallpaperImg.image = UIImage(named: "bg\(indexPath.item + 1)")
        cell.wallpaperImg.layer.cornerRadius = 25
        return cell
    }
}
