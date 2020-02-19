  //
//  ViewController.swift
//  Networking
//
//  Created by Apple on 2020/02/19.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let cellIdentifier: String = "friendCell"
    var friends: [Friend] = []
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let url: URL = URL(string: "https://randomuser.me/api/?results=20&inc=name,email,picture") else { return }
        
        let session: URLSession = URLSession(configuration: .default)
        let dataTask: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                self.friends = apiResponse.results
                
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
            }catch(let err) {
                print(err.localizedDescription)
            }
        }
        dataTask.resume()
    }
    
    
    
    
    
    


}
    extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let friend: Friend = self.friends[indexPath.row]
        
        cell.textLabel?.text = friend.name.first
        cell.detailTextLabel?.text = friend.email
        
        guard let imageURL: URL = URL(string: friend.picture.thumbnail) else {return cell}
        guard let imageData: Data = try? Data(contentsOf: imageURL) else {return cell}
        cell.imageView?.image = UIImage(data: imageData)
        
        return cell
    }
    
    
  }

