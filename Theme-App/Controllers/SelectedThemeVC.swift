//
//  SelectedThemeViewController.swift
//  Theme-App
//
//  Created by Kiyaan M Singh on 04/01/24.
//

import UIKit
import ScalingCarousel

class SelectedThemeVC: UIViewController {

    @IBOutlet weak var bgImg: UIImageView!
    
    
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}

extension SelectedThemeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let carousel = ScalingCarouselView()
        carousel.dataSource = self
        carousel.delegate = self
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedCell", for: indexPath) as! SelectedCell
        cell.wallpaperImg.image = UIImage(named: "placeholder")
        return cell
    }
    
    
}
