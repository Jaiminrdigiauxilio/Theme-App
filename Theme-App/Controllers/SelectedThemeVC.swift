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
    @IBOutlet weak var descpLabel: UILabel!
    @IBOutlet weak var applyThemeBtn: UIButton!
    var collection:UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true

        setBgImg()
        let firstIndexPath = IndexPath(item: 1, section: 0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.collection.scrollToItem(at: firstIndexPath, at: .centeredHorizontally, animated: true)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupCollectionView()
//        applyThemeBtn.layer.cornerRadius = 30
        setDescp()
        navigationItem.title = "Theme"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       
    }
    
    
    func setBgImg() {
        //  fetching stored url from userDefaults
        let usrDefault = UserDefaults.standard
        let rawUrl = usrDefault.string(forKey: "CurrentBg")!
        guard let imgURL = URL(string: rawUrl) else { return }
        //  fetching image and displaying it using KingFisher dependency
        bgImg.kf.setImage(with: imgURL)
    }
    
    func setDescp() {
        descpLabel.text = K.wallpaperDescp
        descpLabel.textAlignment = .left
        
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width / 2, height: 300)
        layout.scrollDirection = .horizontal

        collection = UICollectionView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 350), collectionViewLayout: layout)

        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        //  Register cell classes
        collection.register(SelectedCell.self, forCellWithReuseIdentifier: "SelectedCell")

        //  Add collectionView to the view hierarchy
        view.addSubview(collection)
        
        //  scaling first cell
//        let firstIndexPath = IndexPath(item: 0, section: 0)
//        let firstCell = collection.cellForItem(at: firstIndexPath)
//        firstCell?.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        
    }
    
    
    @IBAction func applyThemeTapped(_ sender: UIButton) {
        
    }
    
}


extension SelectedThemeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    //      Datasource methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedCell", for: indexPath) as! SelectedCell
        cell.wallpaperImg.image = UIImage(named: "placeholder")
        cell.wallpaperImg.layer.cornerRadius = 25
        cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        return cell
    }
    
    //      FlowLayot methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2, height: 300)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 80, bottom: 0, right: 80)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let centerX = scrollView.contentOffset.x + scrollView.frame.width / 2
        for cell in collection.visibleCells {
            let distance = abs(centerX - cell.center.x)
            let scale = max(1 - distance / scrollView.frame.width, 0.5)
            cell.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        let collectionViewWidth = collectionView.bounds.size.width
        let targetX = proposedContentOffset.x + collectionViewWidth / 2
        let targetIndexPath = collectionView.indexPathForItem(at: CGPoint(x: targetX, y: collectionView.bounds.size.height / 2)) ?? IndexPath(item: 0, section: 0)
        let targetCellAttributes = collectionView.layoutAttributesForItem(at: targetIndexPath)
        let targetOffsetX = targetCellAttributes?.center.x ?? 0 - collectionViewWidth / 2
        
        return CGPoint(x: targetOffsetX, y: proposedContentOffset.y)
    }

}
