//
//  Header .swift
//  MultipleSection
//
//  Created by Apple on 2020/04/09.
//  Copyright © 2020 minjae. All rights reserved.
//

import Foundation
import UIKit

class Header: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    
    func setupView() {
        addSubview(headerLabel)
        headerLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
    }
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "end"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
