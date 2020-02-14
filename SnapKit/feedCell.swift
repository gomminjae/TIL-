//
//  feedCell.swift
//  FaceBookUI
//
//  Created by Apple on 2020/02/10.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import SnapKit

class feedCell: UICollectionViewCell {
    
    var post: Post? {
        didSet {
            if let name = post?.name {
                let nameAttribute = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
                
                let subAttribute = [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
                
                let name = NSMutableAttributedString(string: name, attributes: nameAttribute)
                let subName = NSMutableAttributedString(string: "\nsanpransisco -> data", attributes: subAttribute)
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 2
                
                subName.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, name.string.count))
                
                let nameText = NSMutableAttributedString()
                nameText.append(name)
                nameText.append(subName)
                nameLabel.attributedText = nameText
            }
            
            if let statusText = post?.statusText {
                statusTextView.text = statusText
            }
            
            if let profileImg = post?.profileImage {
                profileImage.image = UIImage(named: profileImg)
            }
            
            if let statusImg = post?.statusImage {
                statusImageView.image = UIImage(named: statusImg)
            }
        }
        
    }
    
    
    //MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init error")
    }
    
    //MARK: SnapKit autoLayout
    func setupViews() {
        backgroundColor = .white
        addSubview(nameLabel)
        addSubview(profileImage)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(likeLabel)
        addSubview(dividerLineView)
        dividerLineView.addSubview(likeButton)
        dividerLineView.addSubview(commentButton)
        dividerLineView.addSubview(shareButton)
        
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(75)
            make.centerY.equalTo(40)
            make.top.equalTo(1)
            make.height.equalTo(40
            )
           
        }
        profileImage.snp.makeConstraints { (make) in
            make.height.equalTo(55)
            make.width.equalTo(55)
            make.leading.equalTo(10)
            make.top.equalTo(10)
        }
        
        statusTextView.snp.makeConstraints { (make) in
            make.top.equalTo(profileImage.snp.bottom).offset(-10)
            make.leading.equalTo(profileImage)
            make.trailing.equalTo(-10)
           
        }
        statusImageView.snp.makeConstraints { (make) in
            make.top.equalTo(statusTextView.snp.bottom).inset(40)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(250)
           
        }
        likeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(statusImageView.snp.bottom).offset(10)
            make.leading.equalTo(statusTextView.snp.leading)
        }
        dividerLineView.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(0)
            make.top.equalTo(likeLabel.snp.bottom).offset(5)
            make.bottom.equalTo(3)
        }
        likeButton.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.top.equalTo(5)
            make.width.equalTo(125)
            make.height.equalTo(dividerLineView.snp.height)
        }
        commentButton.snp.makeConstraints { (make) in
            make.leading.equalTo(likeButton.snp.trailing)
            make.top.equalTo(5)
            make.width.equalTo(125)
            make.height.equalTo(dividerLineView.snp.height)
        }
        shareButton.snp.makeConstraints { (make) in
            make.leading.equalTo(commentButton.snp.trailing)
            make.top.equalTo(5)
            make.width.equalTo(125)
            make.height.equalTo(dividerLineView.snp.height)
        }
    }
    
    //MARK: interface
     lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        let nameAttribute = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        
        let subAttribute = [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
        
        let name = NSMutableAttributedString(string: "Simple Name\n", attributes: nameAttribute)
        let subName = NSMutableAttributedString(string: "sanpransisco -> data", attributes: subAttribute)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        
        subName.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, name.string.count))
        
        var nameText = NSMutableAttributedString()
        nameText.append(name)
        nameText.append(subName)
        label.attributedText = nameText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var profileImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "mark")
        img.contentMode = .scaleToFill
        img.backgroundColor = .clear
        return img
    }()
    
    lazy var statusTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Awesome!"
        textView.font = UIFont.boldSystemFont(ofSize: 14)
        //textView.backgroundColor = .lightGray
        textView.isScrollEnabled = false
        textView.isEditable = false
        return textView
    }()
    
    lazy var statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ocean")
        imageView.contentMode = .scaleToFill
        return imageView

    }()
    
    lazy var likeLabel: UILabel = {
        let like = UILabel()
        like.text = "400 Likes  10.7k Comments"
        like.font = UIFont.systemFont(ofSize: 12)
        like.textColor = .lightGray
        return like
    }()
    
    lazy var dividerLineView: UIView = {
        let view = UIView()
        let color = #colorLiteral(red: 0.9678019236, green: 0.9678019236, blue: 0.9678019236, alpha: 1)
        //view.backgroundColor = UIColor(red: 226/255, green: 228/255, blue: 232/255, alpha: 1)
        view.backgroundColor = color
        //view.backgroundColor = UIColor(white: 100, alpha: 1)
        return view
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Like", for: .normal)
        button.setTitleColor(UIColor(red: 143/255, green: 150/255, blue: 163/255, alpha: 1), for: .normal)
        button.setImage(UIImage(named: "like"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Comments", for: .normal)
        button.setTitleColor(UIColor(red: 143/255, green: 150/255, blue: 163/255, alpha: 1), for: .normal)
        button.setImage(UIImage(named: "comment"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    lazy var shareButton: UIButton = {
       let button = UIButton()
        button.setTitle("Share", for: .normal)
        button.setTitleColor(UIColor(red: 143/255 ,green: 150/255, blue: 163/255, alpha: 1), for: .normal)
        button.setImage(UIImage(named: "share"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
}
