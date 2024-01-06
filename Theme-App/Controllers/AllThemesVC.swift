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


extension AllThemesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.seeAllCollectionCellIdentifier, for: indexPath) as! SeeAllCell
        cell.collectionImg.kf.setImage(with: URL(string: K.imgUrl1))
        return cell
    }
}
