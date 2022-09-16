//
//  loginViewController.swift
//  starbucks
//
//  Created by URim on 2022/08/19.
//

import Foundation


import UIKit

class loginViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func login_button(_ sender: Any) {
        print("click")
        let vc = self.storyboard?.instantiateViewController(withIdentifier:"Home") as! Home
        vc.text = self.textField.text ?? ""
        vc.text = vc.text + "님 환영합니다!"
        self.show(vc, sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
         
        
    }
    
}
