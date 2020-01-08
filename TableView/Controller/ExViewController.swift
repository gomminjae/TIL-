//
//  ExViewController.swift
//  TableView
//
//  Created by Apple on 2020/01/08.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ExViewController: UIViewController {

    @IBOutlet weak var Table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension ExViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? tableCell else {
            return UITableViewCell()
        }
        
        cell.titleLabel.text = "title"
        cell.subtitleLabel.text = "subtitle"
        
        return cell
    }
}


//extension ExViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//}
