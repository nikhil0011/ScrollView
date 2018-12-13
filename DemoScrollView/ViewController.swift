//
//  ViewController.swift
//  DemoScrollView
//
//  Created by Admin on 7/31/18.
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var height: NSLayoutConstraint!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var contentview: UIView!
    @IBOutlet weak var tf: UITextField!
    var photoIndex: Int!
    
    var photoName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tf.delegate = self
        if let photoName = photoName {
            self.imageview.image = UIImage(named: photoName)
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        adjustInsetForKeyboardShow(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        adjustInsetForKeyboardShow(false)
    }
    
    func adjustInsetForKeyboardShow(_ show: Bool) {
        let adjustmentHeight = CGFloat(250.0 + 20.0) * (show ? 1 : -1)
        scroll.contentInset.bottom += adjustmentHeight
        scroll.scrollIndicatorInsets.bottom += adjustmentHeight
    }
    
}
