//
//  tabbarViewController.swift
//  naverMap
//
//  Created by JUNI on 2022/09/06.
//

import UIKit

class tabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {


        if viewController is tabbarViewController {

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let controller = storyboard.instantiateViewController(withIdentifier: "surroundViewController") as? surroundViewController {
//                controller.modalPresentationStyle = .fullScreen
                self.present(controller, animated: true, completion: nil)
            }

            return false
        }

        // Tells the tab bar to select other view controller as normal
        return true
    }



}













