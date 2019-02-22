//
//  Video.swift
//  YouTube
//
//  Created by Terranz on 22/2/19.
//  Copyright © 2019 terradevteam. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    var channel: Channel?
}

class Channel: NSObject {
    
    var name: String?
    var profileImageName: String?
}
