//
//  TweetCell.swift
//  TwitterClone
//
//  Created by Mehmet Salih Koçak on 19.11.2018.
//  Copyright © 2018 Mehmet Salih Koçak. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    weak var link:HomeDatasourceController?
    
    let nameAttr = [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 16)]
    let usernameAttr = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.lightGray]
    
    override var datasourceItem: Any? {
        didSet{
            guard let tweet = datasourceItem as? Tweet else{ return }
            
            let attrText = NSMutableAttributedString(string: tweet.user.name, attributes: nameAttr)
            attrText.append(NSAttributedString(string: "  \(tweet.user.username)", attributes: usernameAttr))
            nameLabel.attributedText = attrText
                
            bodyLabel.text = tweet.message
            profileImageView.loadImage(urlString: tweet.user.profileImageUrl)
            mediaImageView.loadImage(urlString: tweet.image.imageUrl)
        }
    }
    
    lazy var profileImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Testing"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    lazy var mediaImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.backgroundColor = UIColor.black
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleZoomTap)))
        return imageView
    }()
    
    @objc func handleZoomTap(tapGesture:UITapGestureRecognizer){
        guard let imageView = tapGesture.view as? UIImageView else{ return }
        NotificationCenter.default.post(name: Constants.imageZoomNotification, object: imageView)
//        link?.performZoomInForImageView(imageToZoomIn: imageView)
    }
    
    let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    let favButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    let dmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = .seperator
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(bodyLabel)
        addSubview(mediaImageView)
        
        profileImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        bodyLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 0)
        
        let bottomButtons = UIStackView(arrangedSubviews: [replyButton, retweetButton, favButton, dmButton])
        bottomButtons.axis = .horizontal
        bottomButtons.distribution = .fillEqually
        addSubview(bottomButtons)
        
        bottomButtons.anchor(nil, left: bodyLabel.leftAnchor, bottom: bottomAnchor, right: bodyLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 8, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        mediaImageView.anchor(bodyLabel.bottomAnchor, left: bodyLabel.leftAnchor, bottom: bottomButtons.topAnchor, right: bodyLabel.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 8, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
