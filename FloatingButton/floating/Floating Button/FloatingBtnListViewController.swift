//
//  FloatingBtnListViewController.swift
//  Floating Button
//
//  Created by Apple on 2020/01/24.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class FloatingBtnListViewController: UIViewController {
    @IBOutlet weak var btnCenter3: NSLayoutConstraint!
    @IBOutlet weak var btnCenter2: NSLayoutConstraint!
    @IBOutlet weak var btnCenter1: NSLayoutConstraint!
    
    @IBAction func dismissBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping:0.7, initialSpringVelocity: 0, options: .transitionCurlDown, animations: {
        self.btnCenter3.constant = 0
        self.btnCenter2.constant = 0
        self.btnCenter1.constant = 0
        self.view.layoutIfNeeded()
            
        }) {(completion) in
            self.dismiss(animated: false, completion: nil)
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        btnCenter1.constant = 0
        btnCenter2.constant = 0
        btnCenter3.constant = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        floating_Animation()
    }
    
    
    func floating_Animation() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.btnCenter1.constant = 80
            self.btnCenter2.constant = 160
            self.btnCenter3.constant = 240
            self.view.layoutIfNeeded()
        }) { (completion) in
            //애니메이션이 끝나는 시점
            
        }
    }
}
