//
//  ViewController.swift
//  customCollectionView
//
//  Created by Apple on 2020/02/18.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

        
//
//    func setupNavigationbar() {
//        navigationController?.navigationBar.backgroundColor = .red
//        navigationController?.navigationBar.barTintColor = UIColor.systemPink
//        navigationController?.navigationBar.topItem?.title = "My Movie List"
//        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.white]
//    }
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupNavigationbar()
        collectionView.register(customCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! customCell
        cell.backgroundColor = .systemPink
            
           return cell
       }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let width = view.frame.width
           let height = CGFloat(300)
           return CGSize(width: width, height: height)
       }
}



