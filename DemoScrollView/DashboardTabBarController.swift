//
//  DashboardTabBarController.swift
//  DemoScrollView
//
//  Created by Admin on 8/2/18.
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit

class DashboardTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        let imageView = UIImageView(frame: frame)
        imageView.image = UIImage(named: "logo")
        navigationItem.titleView = imageView
        let homeController = HomeViewController()
        homeController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
        let secondViewController = MarketPlaceTableViewController()
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        let thridViewController = ScrollViewController()
        thridViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        let tabBarList = [homeController, secondViewController,thridViewController]
        
        viewControllers = tabBarList
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
