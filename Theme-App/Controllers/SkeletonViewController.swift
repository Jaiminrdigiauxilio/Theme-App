//
//  SkeletonViewController.swift
//  Theme-App
//
//  Created by Kiyaan M Singh on 02/01/24.
//

import UIKit

class SkeletonViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addindShimmerEffect()
    }
    
    func addindShimmerEffect()  {
        
        let label = UILabel()
        label.text = "Shimmer"
        label.font = UIFont.systemFont(ofSize: 25)
        label.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 100)
        label.textAlignment = .center
        view.addSubview(label)
        
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        
        label.layer.addSublayer(gradient)
        
        let animationGroup = makeAnimationGroup()
        animationGroup.beginTime = 0.0
        gradient.add(animationGroup, forKey: "backgroundColor")
        
        gradient.frame = label.bounds
        
        view.addSubview(label)
        
    }
    
    func makeAnimationGroup(previousGroup: CAAnimationGroup? = nil) -> CAAnimationGroup {
        let animDuration: CFTimeInterval = 1.5
        
        let anim1 = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.backgroundColor))
        anim1.fromValue = UIColor.lightGray
        anim1.toValue   = UIColor.darkGray
        anim1.duration  = animDuration
        anim1.beginTime = 0.0
        
        let anim2 = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.backgroundColor))
        anim1.fromValue = UIColor.darkGray
        anim1.toValue   = UIColor.lightGray
        anim1.duration  = animDuration
        anim1.beginTime = anim1.beginTime + anim1.duration
        
        let group = CAAnimationGroup()
        group.animations = [anim1, anim2]
        group.repeatCount = .greatestFiniteMagnitude
        group.duration = anim2.beginTime + anim2.duration
        group.isRemovedOnCompletion = false
        
        if let previousGroup = previousGroup {
            group.beginTime = previousGroup.beginTime + 0.33
        }
        return group
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
