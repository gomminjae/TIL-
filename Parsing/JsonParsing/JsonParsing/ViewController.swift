//
//  ViewController.swift
//  JsonParsing
//
//  Created by Apple on 2020/01/26.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import Kanna
class ViewController: UIViewController {
    
    @IBOutlet weak var noticeView: UITableView!
    
    //파싱 데이터 저장
    var notiInfo: [String?] = []
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parsing()
        noticeView.reloadData()
        noticeView.estimatedRowHeight = 100
        noticeView.rowHeight = UITableView.automaticDimension
    }
    override func viewDidAppear(_ animated: Bool) {
        noticeView.reloadData()
    }
    
    
    //MARK: Parsing
    func parsing() {
    let mainURL = "https://www3.chosun.ac.kr/scho/index.do"
           
           guard let main = URL(string: mainURL) else {
               print("Error: \(mainURL)")
               return
           }
           do {
               let noticeMain = try String(contentsOf: main, encoding: .utf8)
               
               let doc = try HTML(html: noticeMain, encoding: .utf8)
               // <li class="recentBbsInnerLi">
               for product in doc.xpath("//li[@class='recentBbsInnerLi']") {
                   if let productUrl = product.at_xpath("a/strong") {
                       let notice: String? = productUrl.text
                    notiInfo.append(notice ?? "공지사항이 없습니다.")
                    
                   }
               }
           }catch let error {
               print("Error: \(error)")
           }
    }
}

//MARK: DataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notiInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? noticeCell else { return UITableViewCell()}
        
        cell.notiLabel.text = notiInfo[indexPath.row]
        cell.notiLabel.minimumScaleFactor = 20
//        cell.notiLabel.preferredMaxLayoutWidth = 150
        
        if cell.notiLabel.adjustsFontSizeToFitWidth == false {
            cell.notiLabel.adjustsFontSizeToFitWidth = true
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}





//MARK: Cell
class noticeCell: UITableViewCell {
    @IBOutlet weak var notiLabel: UILabel!
}


