//
//  SkeletonViewController.swift
//  Theme-App
//
//  Created by Kiyaan M Singh on 02/01/24.
//

import UIKit
import Kingfisher

class ThemeStoreVC: UIViewController {

    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var homeTable: UITableView!
    
    var sectionTitles = ["Best Selling", "New Year", "Movies", "Traditional", "Trending", "Graphic", "Premium", "Free"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setBgFromUsrDefault()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController?.navigationBar.isHidden = true
        backBtn()
        if #available(iOS 15.0, *) {
            homeTable.sectionHeaderTopPadding = 20
        } else {
            // Fallback on earlier versions
        }
        
        
    }
    
    func setBgFromUsrDefault() {
        // fetching stored url from userDefaults
        let usrDefault = UserDefaults.standard
        let rawUrl = usrDefault.string(forKey: "CurrentBg")!
        guard let imgURL = URL(string: rawUrl) else { return }
        //fetching image and displaying it using KingFisher dependency
        bgImg.kf.setImage(with: imgURL)
        
    }
    
    
    func backBtn() {
        let backBtn = UIButton()
        backBtn.backgroundColor = .clear
        backBtn.layer.borderColor =  UIColor.white.cgColor
        backBtn.layer.borderWidth = 1.5
        backBtn.layer.cornerRadius = 10
        backBtn.setTitle("Back", for: .normal)
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.addTarget(self, action: #selector(backBtnTapped(sender:)), for: .touchUpInside)
        view.addSubview(backBtn)
        
//        let title = UILabel()
//        title.text="Theme Store"
//        title.font = UIFont(name: "System", size: 18)
//        title.textColor = .white
//        view.addSubview(title)
        
        //backBtn.constraints
        NSLayoutConstraint.activate([
            backBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 38),
            backBtn.widthAnchor.constraint(equalToConstant: 60),
            backBtn.heightAnchor.constraint(equalToConstant: 20),
            
//            title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 38),
//            title.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
//            title.widthAnchor.constraint(equalToConstant: 200),
//            title.heightAnchor.constraint(equalToConstant: 40),
        ])
        
    }
    

}

//  MARK: - Table View code & Methods
extension ThemeStoreVC: UITableViewDataSource, UITableViewDelegate, selectWallpaperDelegate {
    func didSelectItemIndex(at index: IndexPath) {
        self.performSegue(withIdentifier: K.tappedThemeSegue, sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.tableCellIdentifier, for: indexPath) as! TableCell
        
        cell.homeCollection.tag = indexPath.section
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }

    //      Custom Header view with button
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80))
        headerView.backgroundColor = .clear
        
        let title = UILabel()
        title.text = "\(sectionTitles[section]) Themes"
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        
        let seeAllBtn = UIButton()
        seeAllBtn.translatesAutoresizingMaskIntoConstraints = false
        seeAllBtn.setTitle("See All", for: .normal)
        seeAllBtn.backgroundColor = .clear
        seeAllBtn.addTarget(self, action: #selector(seeAllTapped(sender:)), for: .touchUpInside)
        seeAllBtn.tag = section
        headerView.addSubview(title)
        headerView.addSubview(seeAllBtn)
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 12),
            title.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10),

            seeAllBtn.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -12),
            seeAllBtn.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -5),

        ])
        
        headerView.addSubview(title)
        headerView.addSubview(seeAllBtn)
        
        return headerView
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .clear
    }
    
    
    @objc func seeAllTapped(sender: UIButton)  {
        let currentSection = sender.tag
        debugPrint("\(sectionTitles[currentSection]) see all tapped!")
        performSegue(withIdentifier: K.AllThemesSegue, sender: self)
//        performSegue(withIdentifier: K.tappedThemeSegue, sender: self)
        
    }
    
    @objc func backBtnTapped(sender: UIButton)  {
        
    }
}

