//
//  ViewController.swift
//  Carousel
//
//  Created by Apple on 2020/02/17.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let carouselCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .init(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: flowLayout)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 20
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .red
        return collectionView
    }()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(carouselCollectionView)
        NSLayoutConstraint.activate([
        carouselCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
        carouselCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
        carouselCollectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
        carouselCollectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
        carouselCollectionView.delegate = self
        carouselCollectionView.dataSource = self
        carouselCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) //as? testCell else { return UICollectionViewCell()}
        
        cell.backgroundColor = .orange
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 80, height: view.frame.height)
    }
}

