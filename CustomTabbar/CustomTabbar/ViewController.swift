//
//  ViewController.swift
//  CustomTabbar
//
//  Created by Apple on 2020/08/09.
//  Copyright © 2020 minjae. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, CustomMenuBarDelegate {
    
    
    
    func customMenuBar(scrollTo index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        self.pageCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    
    var pageCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var menuBar = MenuBar()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navigationController?.hidesBarsOnSwipe = true
        setupCustomTabbar()
        settupPageCollectionView()
        title = "customTabbar"
    }
    
    private func setupCustomTabbar() {
        self.view.addSubview(menuBar)
        menuBar.delegate = self
        menuBar.indicatorView.snp.makeConstraints {
            $0.width.equalTo(self.view.frame.width / 4)
        }
        menuBar.snp.makeConstraints {
            $0.leading.equalTo(self.view.snp.leading)
            $0.trailing.equalTo(self.view.snp.trailing)
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(60)
        }
    }
    private func settupPageCollectionView() {
        pageCollectionView.delegate = self
        pageCollectionView.dataSource = self
        pageCollectionView.backgroundColor = .gray
        pageCollectionView.showsHorizontalScrollIndicator = false
        pageCollectionView.isPagingEnabled = true
        pageCollectionView.register(PageCell.self, forCellWithReuseIdentifier: PageCell.reusableIdentifier)
        self.view.addSubview(pageCollectionView)
        pageCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        pageCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        pageCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        pageCollectionView.topAnchor.constraint(equalTo: self.menuBar.bottomAnchor).isActive = true
    }
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCell.reusableIdentifier, for: indexPath) as! PageCell
        cell.label.text = "\(indexPath.row + 1)번째 뷰"
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
           menuBar.indicatorViewLeadingConstraint.constant = scrollView.contentOffset.x / 4
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
           let itemAt = Int(targetContentOffset.pointee.x / self.view.frame.width)
           let indexPath = IndexPath(item: itemAt, section: 0)
           menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
       }
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: pageCollectionView.frame.width, height: pageCollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

