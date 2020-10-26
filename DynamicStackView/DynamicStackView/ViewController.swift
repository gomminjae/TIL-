//
//  ViewController.swift
//  DynamicStackView
//
//  Created by 권민재 on 2020/10/17.
//

import UIKit

class ViewController: UIViewController {
    
    var vertical = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        vertical.axis = .vertical
        vertical.translatesAutoresizingMaskIntoConstraints = false
        vertical.spacing = 10
        vertical.distribution = .fillEqually
        view.addSubview(vertical)
        
        let horizontal = UIStackView()
        horizontal.axis = .horizontal
        horizontal.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(horizontal)
        
        let addButton = UIButton()
        let removeButton = UIButton()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func addView() {
        let view = UIView()
        view.backgroundColor = .systemIndigo
        view.isHidden = true
        vertical.addArrangedSubview(view)
        
        UIView.animate(withDuration: 0.3) {
            view.isHidden = false
        }
    }
    
    @objc func removeView() {
        guard let last = vertical.arrangedSubviews.last else { return }
        
        UIView.animate(withDuration: 0.3) {
            last.isHidden = true
        } completion: { _ in
            self.vertical.removeArrangedSubview(last)
        }
    }


}

