//
//  TrackCell.swift
//  AVTesting
//
//  Created by Apple on 2020/02/27.
//  Copyright © 2020 minjae. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import AVFoundation

class TrackCell: UITableViewCell {
    
    var delegate: TableViewCellDelegate?
    var musicPlayer: AVPlayer?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init error")
    }
    func setupView() {
        addSubview(titleLabel)
        addSubview(playButton)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(4)
            make.leading.equalTo(10)
            
        }
        playButton.snp.makeConstraints { (make) in
            make.top.equalTo(4)
            make.leading.equalTo(titleLabel.snp.trailing).offset(30)
        }
    }
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return label
    }()
    
    lazy var playButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
        return button
    }()
    
    
    
    
    
}
