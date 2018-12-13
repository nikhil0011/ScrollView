//
//  ScrollViewController.swift
//  DemoScrollView
//
//  Created by Admin on 12/13/18.
//  Copyright © 2018 demo. All rights reserved.
//


import UIKit

class ScrollViewController: UIViewController {
    
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize.height = 2000
        view.backgroundColor = UIColor.brown
        
        return view
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        setupScrollView()
    }
    
    func setupScrollView(){
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        let firstLabel = UILabel()
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.textColor = .white
        firstLabel.text = "Top of our ScrollView"
        
        scrollView.addSubview(firstLabel)
        
        firstLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        firstLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        firstLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        firstLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        let secondLabel = UILabel()
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.textColor = .white
        secondLabel.text = "Bottom of our ScrollView"
        
        scrollView.addSubview(secondLabel)
        
        secondLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        secondLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1900).isActive = true
        secondLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        secondLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        
        
    }
    
    
    
}

