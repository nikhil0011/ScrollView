//
//  ManagePageViewController.swift
//  DemoScrollView
//
//  Created by Admin on 8/1/18.
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit

class ManagePageViewController: UIPageViewController {
    var photos = ["photo1", "photo2", "photo3", "photo4", "photo5"]
    var currentIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        if let viewController = viewPhotoCommentController(currentIndex ?? 0) {
            let viewControllers = [viewController]
            
            // 2
            setViewControllers(
                viewControllers,
                direction: .forward,
                animated: false,
                completion: nil
            )
        }
        dataSource = self
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        let closebutton = UIButton()
        closebutton.titleLabel?.text = "Close"
        closebutton.titleLabel?.textColor  = .white
        closebutton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 12.0)
        closebutton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 12.0)
        closebutton.addTarget(self, action: #selector(closeVc), for: .allTouchEvents)
        self.view.addSubview(closebutton)
    }
    
    @objc func closeVc(){
            self.dismiss(animated: true, completion: nil)
    }
    
    func viewPhotoCommentController(_ index: Int) -> ViewController? {
        guard let storyboard = storyboard,
            let page = storyboard.instantiateViewController(withIdentifier: "ViewController")
                as? ViewController else {
                    return nil
        }
        page.photoName = photos[index]
        page.photoIndex = index
        return page
    }
}
extension ManagePageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? ViewController,
            let index = viewController.photoIndex,
            index > 0 {
            return viewPhotoCommentController(index - 1)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let viewController = viewController as? ViewController,
            let index = viewController.photoIndex,
            (index + 1) < photos.count {
            return viewPhotoCommentController(index + 1)
        }
        
        return nil
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return photos.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex ?? 0
    }
}

