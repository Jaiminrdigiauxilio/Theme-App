//
//  TableCell.swift
//  Theme-App
//
//  Created by Kiyaan M Singh on 03/01/24.
//

import UIKit
import Kingfisher

class TableCell: UITableViewCell{
    @IBOutlet weak var homeCollection: UICollectionView!
    
    var imgUrlArr = [
        K.imgUrl1,
        K.imgUrl2,
        K.imgUrl3,
        K.imgUrl4,
        K.imgUrl5,
        K.imgUrl6,
        K.imgUrl7,
        K.imgUrl8,
    ]
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


extension TableCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.collectionCellIdentifier, for: indexPath) as! CollectionCell
        
        //  kingfisher code
        cell.wallpaperImg.image = nil
        cell.wallpaperImg.kf.indicatorType = .activity
        let resource = KF.ImageResource(downloadURL: URL(string: imgUrlArr[homeCollection.tag])!, cacheKey: "\(indexPath.section)")
        let placeImg = UIImage(named: "bg1")
        cell.wallpaperImg.kf.setImage(with: resource,placeholder: placeImg, options: [.transition(.fade(0.2))])
        cell.wallpaperImg.kf.indicatorType = .activity
        cell.wallpaperImg.layer.cornerRadius = 25
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint("Image at \(indexPath.item) in \(homeCollection.tag) section is tapped!")
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}