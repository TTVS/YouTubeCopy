//
//  ViewController.swift
//  YouTube
//
//  Created by Terranz on 20/2/19.
//  Copyright © 2019 terradevteam. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var videos: [Video] = {
        
        var channel_1 = Channel()
        channel_1.name = "Channel 1"
        channel_1.profileImageName = "profile_image_1"
        
        var channel_2 = Channel()
        channel_2.name = "Channel 2"
        channel_2.profileImageName = "profile_image_2"
        
        var video_1 = Video()
        video_1.title = "Video Number 1 kdjashdhalskdddsdssdshld"
        video_1.thumbnailImageName = "video_1"
        video_1.channel = channel_1
        video_1.numberOfViews = 12324
//        video_1.uploadDate = NSDate(
        
        var video_2 = Video()
        video_2.title = "Video Number 2"
        video_2.thumbnailImageName = "video_2"
        video_2.channel = channel_2
        video_2.numberOfViews = 65324
//        video_2.uploadDate = 2 months ago
        
        return [video_1, video_2]
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        
        //remove black bar under navbar
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        collectionView.backgroundColor = UIColor.white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        setupMenuBar()
        setupNavBarButtons()
    }
    
    func setupNavBarButtons() {
        let searchImage = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain
            , target: self, action: #selector(handleSearch))
        
        let moreImage = UIImage(named: "more")?.withRenderingMode(.alwaysOriginal)
        let moreButtonItem = UIBarButtonItem(image: moreImage, style: .plain
            , target: self, action: #selector(handleMore))
        
        navigationItem.rightBarButtonItems = [moreButtonItem, searchBarButtonItem]
    }
    
    @objc func handleSearch() {
        
    }
    
    @objc func handleMore() {
        
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]|", views: menuBar)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
        
        cell.video = videos[indexPath.item]
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let thumbnailHeight = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: thumbnailHeight + 16 + 88)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

