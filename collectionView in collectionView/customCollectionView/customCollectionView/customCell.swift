//
//  customCell.swift
//  customCollectionView
//
//  Created by Apple on 2020/02/18.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import SnapKit

class customCell: UICollectionViewCell,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "subCell", for: indexPath)
        cell.backgroundColor = .orange
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = frame.height / 2
        let height = frame.height / 2
        
        return CGSize(width: width, height: height)
        
    }
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .init(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: layout)
        return collectionView
    }()
    
    
    
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Section Title"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(8)
            make.leading.equalTo(8)
        }
        setupSubCells()
        collectionView.register(subCustomCell.self, forCellWithReuseIdentifier: "subCell")

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init error")
    }
    
    fileprivate func setupSubCells() {
        addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.equalTo(0)
            make.bottom.equalTo(0)
            make.trailing.equalTo(0)
        }
    
    }
    
    
    
    
    
    
    
    
    
}
