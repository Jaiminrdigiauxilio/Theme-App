//
//  AllThemesViewController.swift
//  Theme-App
//
//  Created by Kiyaan M Singh on 04/01/24.
//

import UIKit

class SeeAllThemesVC: UIViewController {

    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var themeCollection: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setBgFromUsrDefault()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
    }

    func setBgFromUsrDefault() {
        // fetching stored url from userDefaults
        let usrDefault = UserDefaults.standard
        let rawUrl = usrDefault.string(forKey: "CurrentBg")!
        guard let imgURL = URL(string: rawUrl) else { return }
        //fetching image and displaying it using KingFisher dependency
        bgImg.kf.setImage(with: imgURL)
    }
}


extension SeeAllThemesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.seeAllCollectionCellIdentifier, for: indexPath) as! SeeAllCell
        cell.collectionImg.kf.indicatorType = .activity
        cell.collectionImg.layer.cornerRadius = 25
        cell.collectionImg.layer.masksToBounds = true
        cell.collectionImg.kf.setImage(with: URL(string: K.imgUrl1), placeholder: UIImage(named: "placeholder"))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/2 - 18, height: 210)
    }
}
