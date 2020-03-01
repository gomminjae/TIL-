//
//  Track.swift
//  AVTesting
//
//  Created by Apple on 2020/02/27.
//  Copyright © 2020 minjae. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Track {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    var asset: AVAsset {
        let path = Bundle.main.path(forResource: title, ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        let asset = AVAsset(url: url)
        return asset
    }
}
