//
//  SkeletonViewController.swift
//  Theme-App
//
//  Created by Kiyaan M Singh on 02/01/24.
//

import UIKit
import Kingfisher

class SkeletonViewController: UIViewController {

    @IBOutlet weak var bgImgView: UIImageView!
    @IBOutlet weak var homeTable: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setBgFromUsrDefault()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTable.sectionHeaderTopPadding = 20

    }
    
    func setBgFromUsrDefault() {
        guard let url = URL(string: K.defaultBg) else { return }
        bgImgView.kf.setImage(with: url)
    }
    
    
    

}

extension SkeletonViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: K.tableCellIdentifier, for: indexPath) as! TableCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Wallpapers"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        let title = UILabel()
        title.text = "Wallpapers"
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        
//        NSLayoutConstraint.activate([title.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 12), title.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)])
//        headerView.addSubview(title)
        return headerView
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .clear
    }
    
}






// skeleton view code
//    func addindShimmerEffect()  {
//
//        let label = UILabel()
//        label.text = "Shimmer"
//        label.font = UIFont.systemFont(ofSize: 25)
//        label.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 100)
//        label.textAlignment = .center
//        view.addSubview(label)
//
//        let gradient = CAGradientLayer()
//        gradient.startPoint = CGPoint(x: 0, y: 0.5)
//        gradient.endPoint = CGPoint(x: 1, y: 0.5)
//
//        label.layer.addSublayer(gradient)
//
//        let animationGroup = makeAnimationGroup()
//        animationGroup.beginTime = 0.0
//        gradient.add(animationGroup, forKey: "backgroundColor")
//
//        gradient.frame = label.bounds
//
//        view.addSubview(label)
//    }
    

//    func makeAnimationGroup(previousGroup: CAAnimationGroup? = nil) -> CAAnimationGroup {
//        let animDuration: CFTimeInterval = 1.5
//
//        let anim1 = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.backgroundColor))
//        anim1.fromValue = UIColor.lightGray
//        anim1.toValue   = UIColor.darkGray
//        anim1.duration  = animDuration
//        anim1.beginTime = 0.0
//
//        let anim2 = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.backgroundColor))
//        anim1.fromValue = UIColor.darkGray
//        anim1.toValue   = UIColor.lightGray
//        anim1.duration  = animDuration
//        anim1.beginTime = anim1.beginTime + anim1.duration
//
//        let group = CAAnimationGroup()
//        group.animations = [anim1, anim2]
//        group.repeatCount = .greatestFiniteMagnitude
//        group.duration = anim2.beginTime + anim2.duration
//        group.isRemovedOnCompletion = false
//
//        if let previousGroup = previousGroup {
//            group.beginTime = previousGroup.beginTime + 0.33
//        }
//        return group
//    }
