//
//  ViewController.swift
//  Floating Button
//
//  Created by Apple on 2020/01/24.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var byn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "showPopUp" {
              let floatingVC = segue.destination as? FloatingBtnListViewController
              floatingVC?.modalPresentationStyle = .overCurrentContext
          }
      }
      
      


}

