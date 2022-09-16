//
//  gift.swift
//  starbucks
//
//  Created by URim on 2022/08/19.
//

import Foundation
import UIKit

class gift: UIViewController {

 
    @IBOutlet weak var gift: UIView!
    @IBOutlet weak var st2: UIView!
    
    @IBOutlet weak var st3: UIView!
    @IBOutlet weak var st1: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gift.layer.shadowColor = UIColor.gray.cgColor // 색깔
        gift.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        gift.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        gift.layer.shadowRadius = 2 // 반경
        gift.layer.shadowOpacity = 0.3 // alpha값
        
        st1.layer.shadowColor = UIColor.black.cgColor // 색깔
        st1.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        st1.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        st1.layer.shadowRadius = 5 // 반경
        st1.layer.shadowOpacity = 0.3 // alpha값
   
        st2.layer.shadowColor = UIColor.black.cgColor // 색깔
        st2.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        st2.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        st2.layer.shadowRadius = 5 // 반경
        st2.layer.shadowOpacity = 0.3 // alpha값
   
        st3.layer.shadowColor = UIColor.black.cgColor // 색깔
        st3.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        st3.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        st3.layer.shadowRadius = 5 // 반경
        st3.layer.shadowOpacity = 0.3 // alpha값
   
    
    }

  
    
}
