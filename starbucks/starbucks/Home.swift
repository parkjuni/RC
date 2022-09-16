//
//  home.swift
//  starbucks
//
//  Created by URim on 2022/08/19.
//
import Foundation
import UIKit

class Home: UIViewController {

    
    @IBOutlet weak var login: UIButton!
    
    @IBOutlet weak var login_view: UIView!
    
    @IBOutlet weak var img1: UIView!
    @IBOutlet weak var img3: UIView!
    @IBOutlet weak var img2: UIView!
    
    @IBOutlet weak var button_login: UIButton!
    
    var text:String = ""
    
    @IBAction func clickButton(_ sender: Any) {
        print("click")
        let home = self.storyboard?.instantiateViewController(withIdentifier:"loginViewController") as! loginViewController
        self.present(home, animated: true, completion: nil)
    }
    
    @IBOutlet weak var login_label: UILabel!
    
    
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img6: UIImageView!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.login_label.text = text 
        // Do any additional setup after loading the view.
        login.layer.borderWidth = 1
             //테두리 색상
//        login.layer.borderColor = UIColor.green.cgColor
        
        login_view.layer.shadowColor = UIColor.gray.cgColor // 색깔
        login_view.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        login_view.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        login_view.layer.shadowRadius = 5 // 반경
        login_view.layer.shadowOpacity = 0.3 // alpha값
    
    
        img1.layer.shadowColor = UIColor.gray.cgColor // 색깔
        img1.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        img1.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        img1.layer.shadowRadius = 5 // 반경
        img1.layer.shadowOpacity = 0.3 // alpha값
        img2.layer.shadowColor = UIColor.gray.cgColor // 색깔
        img2.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        img2.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        img2.layer.shadowRadius = 5 // 반경
        img2.layer.shadowOpacity = 0.3 // alpha값
    
        img3.layer.shadowColor = UIColor.gray.cgColor // 색깔
        img3.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        img3.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        img3.layer.shadowRadius = 5 // 반경
        img3.layer.shadowOpacity = 0.3 // alpha값
        
         
        
    }
    
}
