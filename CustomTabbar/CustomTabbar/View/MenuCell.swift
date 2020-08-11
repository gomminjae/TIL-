//
//  MenuCell.swift
//  CustomTabbar
//
//  Created by Apple on 2020/08/09.
//  Copyright © 2020 minjae. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet{
            print("Changed")
            self.label.textColor = isSelected ? .black : .lightGray
        }
    }
    func setupViews() {
        addSubview(label)
        label.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.centerY.equalTo(self)
        }
    }
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "Section"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .lightGray
        
        return label
    }()
    
}
