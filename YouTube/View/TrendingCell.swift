//
//  TrendingCell.swift
//  YouTube
//
//  Created by Terranz on 24/2/19.
//  Copyright © 2019 terradevteam. All rights reserved.
//

import UIKit

class TrendingCell: FeedCell {
    
    override func fetchVideos() {
        ApiService.sharedInstance.fetchTrendingFeed { (videos: [Video]) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}
