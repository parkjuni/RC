//
//  pay.swift
//  starbucks
//
//  Created by URim on 2022/08/19.
//

import UIKit

class pay: UIViewController {

    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var pay: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        card.layer.shadowColor = UIColor.black.cgColor // 색깔
        card.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        card.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        card.layer.shadowRadius = 5 // 반경
        card.layer.shadowOpacity = 0.3 // alpha값
        pay.layer.shadowColor = UIColor.gray.cgColor // 색깔
        pay.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        pay.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        pay.layer.shadowRadius = 2 // 반경
        pay.layer.shadowOpacity = 0.3 // alpha값
    
    }

  
    
}
