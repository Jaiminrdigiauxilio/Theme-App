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
        
        let flowLayout = FlowLayout()
        themeCollection.collectionViewLayout = flowLayout
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
        cell.collectionImg.kf.setImage(with: URL(string: K.imgUrl2))
        return cell
    }
}


class FlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init()
        commonInit()
        fatalError("init(coder:) has not been implemented")
        
    }
    private func commonInit() {
        scrollDirection = .horizontal
        minimumLineSpacing = 10
        minimumInteritemSpacing = 10
    }
    
    override var itemSize: CGSize {
            set {
                // Adjust the width and height based on your requirements
                let newWidth = (collectionView!.bounds.width - minimumInteritemSpacing) / 2
                super.itemSize = CGSize(width: newWidth, height: newValue.height)
            }
            get {
                return super.itemSize
            }
        }
    
    
    
}
