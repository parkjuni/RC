//
//  PopupViewController.swift
//  w4
//
//  Created by JUNI on 2022/08/30.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var _return: UIImageView!
    @IBOutlet weak var goHome: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self._return.isUserInteractionEnabled = true
        //제쳐스 추가
        self._return.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self._returnTapped)))
        
        self.goHome.isUserInteractionEnabled = true
        //제쳐스 추가
        self.goHome.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.homeTapped)))
        
    }
    
    @objc func _returnTapped(_ sender: UITapGestureRecognizer) {
            let GameViewController = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController")
        GameViewController?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
        GameViewController!.modalTransitionStyle = .crossDissolve
        self.present(GameViewController! , animated: true)
        }
    
    @objc func homeTapped(_ sender: UITapGestureRecognizer) {
            let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "homeViewController")
        homeViewController?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
        homeViewController!.modalTransitionStyle = .crossDissolve
        self.present(homeViewController! , animated: true)
        }
    
    
    }
    


