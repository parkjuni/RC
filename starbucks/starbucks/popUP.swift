//
//  popUP.swift
//  starbucks
//
//  Created by URim on 2022/08/19.
//


import Foundation
import UIKit

class popUP: UIViewController {

    
  
    @IBOutlet weak var popupView: UIView!
    //    var shadowOpacity : Float { get set}


    
    @IBAction func close_button(_ sender: Any) {
        print("click")
        self.dismiss(animated: false, completion: nil)  // 사라지게 하기
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        popupView.layer.cornerRadius = 40
//        popupView.layer.shadowOpacity = 0.5

    }

  
    
}
