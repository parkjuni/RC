//
//  ViewController.swift
//  naverMap
//
//  Created by JUNI on 2022/09/04.
//

import UIKit
import Alamofire



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
    }



    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {


        if viewController is ViewController {

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let controller = storyboard.instantiateViewController(withIdentifier: "surroundViewController") as? surroundViewController {
                controller.modalPresentationStyle = .fullScreen
                self.present(controller, animated: true, completion: nil)
            }

            return false
        }

        // Tells the tab bar to select other view controller as normal
        return true
    }

}








