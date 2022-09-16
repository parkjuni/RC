//
//  CustomSideMenuNavigation.swift
//  naverMap
//
//  Created by JUNI on 2022/09/12.
//

import UIKit
import SideMenu

class CustomSideMenuNavigation: SideMenuNavigationController{
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presentationStyle = .menuSlideIn
        self.leftSide = true
        self.presentDuration = 1.0
        self.dismissDuration = 1.0
//        SideMenuManager.default.menuAnimationFadeStrength = 0.5
        self.presentationStyle.backgroundColor = .black
                self.presentationStyle.presentingEndAlpha = 0.7

                self.statusBarEndAlpha = 0.0
//                self.menuWidth = (UIScreen.main.bounds.width / 5) * 4

    }


}
