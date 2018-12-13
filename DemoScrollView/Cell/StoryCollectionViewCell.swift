//
//  StoryCollectionViewCell.swift
//  DemoScrollView
//
//  Created by Admin on 8/2/18.
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    let profileImageButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.setImage(UIImage(named: "photo2"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.text = "Bob Lee"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
        backgroundColor = .white
        addSubview(profileImageButton)
        addSubview(nameLabel)
        profileImageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        profileImageButton.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
        profileImageButton.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        profileImageButton.widthAnchor.constraint(equalToConstant: 60.0).isActive = true
//        profileImageButton.layer.cornerRadius = profileImageButton.frame.width/2.0

        nameLabel.topAnchor.constraint(equalTo: profileImageButton.bottomAnchor, constant: 8.0).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        nameLabel.rightAnchor.constraintLessThanOrEqualToSystemSpacingAfter(rightAnchor, multiplier: 8.0).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: profileImageButton.centerXAnchor, constant: 0).isActive = true
    }
}

