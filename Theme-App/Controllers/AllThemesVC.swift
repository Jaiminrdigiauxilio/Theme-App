//
//  AllThemesViewController.swift
//  Theme-App
//
//  Created by Kiyaan M Singh on 04/01/24.
//

import UIKit

class AllThemesVC: UIViewController {

    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var themeCollection: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setBgFromUsrDefault()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func setBgFromUsrDefault() {
        guard let url = URL(string: K.defaultBg) else { return }
        bgImg.kf.setImage(with: url)
    }
}


extension AllThemesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.seeAllCollectionCellIdentifier, for: indexPath) as! SeeAllCell
        cell.collectionImg.kf.indicatorType = .activity
        cell.collectionImg.layer.cornerRadius = 25
        cell.collectionImg.layer.masksToBounds = true
        cell.collectionImg.kf.setImage(with: URL(string: K.imgUrl2), placeholder: UIImage(named: "placeholder"))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/2 - 18, height: 210)
    }
}
