//
//  tableCell.swift
//  TableView
//
//  Created by Apple on 2020/01/08.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class tableCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(content: Content) {
        titleLabel.text = content.titles
    }
    


}
