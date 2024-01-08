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
    @IBOutlet weak var descpLabel: UILabel!
    @IBOutlet weak var applyThemeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBgImg()

    }
    
    func setBgImg() {
        // fetching stored url from userDefaults
        let usrDefault = UserDefaults.standard
        let rawUrl = usrDefault.string(forKey: "CurrentBg")!
        guard let imgURL = URL(string: rawUrl) else { return }
        //fetching image and displaying it using KingFisher dependency
        bgImg.kf.setImage(with: imgURL)
    }
    
    
    @IBAction func applyThemeTapped(_ sender: UIButton) {
    }
    
    
    
}

extension SelectedThemeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // Datasource methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedCell", for: indexPath) as! SelectedCell
        cell.wallpaperImg.image = UIImage(named: "placeholder")
        return cell
    }
    
    //      FlowLayot methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2, height: 250)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }

}
