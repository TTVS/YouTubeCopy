//
//  Video.swift
//  YouTube
//
//  Created by Terranz on 22/2/19.
//  Copyright © 2019 terradevteam. All rights reserved.
//

import UIKit

struct Video: Decodable {
    let title: String?
    let numberOfViews: Int?
    let thumbnailImageName: String?
    let channel: Channel?
    let duration: Int?
    let uploadDate: Date?
}

struct Channel: Decodable {
    let name: String?
    let profileImageName: String?
}
