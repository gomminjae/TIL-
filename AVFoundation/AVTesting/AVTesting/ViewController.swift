//
//  ViewController.swift
//  AVTesting
//
//  Created by Apple on 2020/02/27.
//  Copyright © 2020 minjae. All rights reserved.
//

import UIKit
import AVFoundation
import SnapKit

var musicTrackList: [Track] = []
class ViewController: UIViewController {
    
    var tableView: UITableView = {
        let view = UITableView()
        //view.backgroundColor = .orange
        return view
    }()
    
    var player: AVPlayer?
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadTrackList()
        view.addSubview(tableView)
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(0)
            make.top.bottom.equalTo(0)
        }
        tableView.register(TrackCell.self, forCellReuseIdentifier: "cell")
    }
    
    func loadTrackList() {
        musicTrackList = [
            Track(title: "Die For The REal (INST)"),
            Track(title: "Body cosmetic Toujours remix"),
            Track(title: "콜드 오션 (Prod. by GRIO)"),
            Track(title: "갸갸갸갸갹")
        ]
    }
    
    @objc func play(_ sender: AnyObject) {
        if let Musicplay = player {
            Musicplay.play()
        }
    }
    
    @objc func stop(_ sender: AnyObject) {
        if let stopPlayer = player {
            stopPlayer.pause()
        }
    }
    @objc func musicPlay(_ sender: UIButton) {
          sender.isSelected = false
          
          if sender.isSelected {
            player?.play()
          }else {
            player?.pause()
            sender.isSelected = false
          }
      }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicTrackList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TrackCell else { return UITableViewCell() }
        cell.titleLabel.text = musicTrackList[indexPath.row].title
        cell.playButton.addTarget(self, action: #selector(musicPlay), for: .touchUpInside)
        if cell.playButton.isSelected {
            let asset = musicTrackList[indexPath.row].asset
            let playItem = AVPlayerItem(asset: asset)
            let music = AVPlayer(playerItem: playItem)
            player = music
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row + 1)is clicked")
    }
    
}

