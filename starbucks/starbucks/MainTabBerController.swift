//
//  ViewController.swift
//  starbucks
//
//  Created by URim on 2022/08/14.
//

import UIKit

class MainTabBerController: UITabBarController {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//    
//    @IBAction func showPopup(_ sender: Any) {
//           // PopupViewController가 나와야 하는 부분.
//           
//           
//           let storyBoard = UIStoryboard.init(name: "Popup", bundle: nil)    // Popup라는 이름을 가진 스토리보드를 가져옴
//           
//           let popupVC = storyBoard.instantiateViewController(identifier: "popupView")  // 뷰컨트롤러를 불러오는 함수. identifier는 뷰컨트롤러의 storyboard ID.
//           
//           popupVC.modalPresentationStyle = .overCurrentContext    //  투명도가 있으면 투명도에 맞춰서 나오게 해주는 코드(뒤에있는 배경이 보일 수 있게)
//           self.present(popupVC, animated: false, completion: nil)
//       }
    
//    @IBAction func showPopup(_ sender: Any) {
//      let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
//      let popupVC = storyBoard.instantiateViewController(withIdentifier: "popupView")
//      popupVC.modalPresentationStyle = .overCurrentContext
//      present(popupVC, animated: true, completion: nil)
//    }
   
    @IBAction func showPopup(_ sender: Any) {
      let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
      let popupVC = storyBoard.instantiateViewController(withIdentifier: "popUP")
      popupVC.modalPresentationStyle = .overCurrentContext
      present(popupVC, animated: true, completion: nil)
    }
    
    
    

}

