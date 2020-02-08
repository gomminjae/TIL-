//
//  ViewController.swift
//  calendar
//
//  Created by Apple on 2020/02/08.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import FSCalendar

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate weak var calendar: FSCalendar!
    private var info: [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 50, width: 400, height: 400))
        view.addSubview(calendar)
        self.calendar = calendar
        calendar.delegate = self
        calendar.dataSource = self
        calendar.allowsMultipleSelection = true
        calendar.appearance.eventDefaultColor = UIColor.green
        calendar.setScope(.month, animated: true)
    }
}

extension ViewController: FSCalendarDataSource,FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let alert = UIAlertController(title: "ex", message: "let me show your plan", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alert.addTextField { (myTextField) in
            myTextField.textColor = .gray
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: false)
    }
}



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}
