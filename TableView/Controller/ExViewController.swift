//
//  ExViewController.swift
//  TableView
//
//  Created by Apple on 2020/01/08.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ExViewController: UIViewController {
    
    var content: [String] = []

    @IBOutlet weak var Table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Table.backgroundColor = UIColor.gray

    }
    
   //셀 추가 버튼
    @IBAction func addContent(_ sender: Any) {
        let alertController = UIAlertController(title: "추가하기", message: "정보를 입력하시오 ", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "정보 입력"
        }
        
        let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
            let textField = alertController.textFields![0]
            
            if let newContent = textField.text, newContent != "" {
                self.content.append(newContent)
                let indexPath = IndexPath(row: self.content.count - 1, section: 0)
                self.Table.insertRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}



extension ExViewController: UITableViewDataSource {
    
    //셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    //셀 정보 표사ㅣ
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? tableCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = "\(content[indexPath.row])"
        
        return cell
    }
    
    //Swipe 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            content.remove(at: indexPath.row)
            Table.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    
    
    
}

        
extension ExViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000
    }
}






