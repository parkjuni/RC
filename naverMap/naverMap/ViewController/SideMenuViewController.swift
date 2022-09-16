//
//  SideMenuViewController.swift
//  naverMap
//
//  Created by JUNI on 2022/09/12.
//

import UIKit

import Alamofire
import NaverThirdPartyLogin

class userInfo {
    
    static var shared = userInfo()
    var userName:String!
    
    private init() { }

}



class SideMenuViewController: UIViewController {

    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var logout: UILabel!
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let gesture = UITapGestureRecognizer(target: self, action: #selector(goLogin(_:)));    self.userView.addGestureRecognizer(gesture)
        userId.isHidden = true
        logout.isHidden = true


    }
    
    
    override func viewWillAppear(_ animated:Bool) {
        let ud = UserDefaults.standard
       
        if let nick = ud.string(forKey:"nickname"){
            userName.text = nick }
        
        if let Name = ud.string(forKey:"name"){
            userId.text = Name
            userId.isHidden = false
            logout.isHidden = false


        }
        
//        self.logout.isHidden = false

    }
    
    

    @objc private func goLogin(_ sender: UIGestureRecognizer) {
      loginInstance?.delegate = self
      loginInstance?.requestThirdPartyLogin()
    }
    
    @objc private func goLogout(_ sender: UIGestureRecognizer) {
       loginInstance?.requestDeleteToken()
     }

    private func getNaverInfo() {
      guard let isValidAccessToken = loginInstance?.isValidAccessTokenExpireTimeNow() else { return }
      
      if !isValidAccessToken {
        return
      }
      
      guard let tokenType = loginInstance?.tokenType else { return }
      guard let accessToken = loginInstance?.accessToken else { return }
      let urlStr = "https://openapi.naver.com/v1/nid/me"
      let url = URL(string: urlStr)!
      
      let authorization = "\(tokenType) \(accessToken)"
      
      let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
      
      req.responseJSON { response in
        guard let result = response.value as? [String: Any] else { return }
        guard let object = result["response"] as? [String: Any] else { return }
        guard let nickname = object["nickname"] as? String else { return }
          guard let name = object["name"] as? String else { return }

//        guard let profile = object["profile_image"] as? String else { return }

        guard let id = object["id"] as? String else { return }
//        
//        self.userName.text = "\(nickname)"
////        self.emailLabel.text = "\(email)"
//        self.userId.text = "\(name)"
//          self.userId.isHidden = false
//          self.userImage.image = UIImage(named:profile)
          
          let UserInfo = userInfo.shared
          UserInfo.userName = name
          self.logout.isHidden = false

          let ud = UserDefaults.standard
          ud.set(self.userName.text, forKey: "nickname")
          ud.set(self.userId.text, forKey: "name")

          
      }
    }
}

extension SideMenuViewController: NaverThirdPartyLoginConnectionDelegate {
  // 로그인 버튼을 눌렀을 경우 열게 될 브라우저
  func oauth20ConnectionDidOpenInAppBrowser(forOAuth request: URLRequest!) {
//     let naverSignInVC = NLoginThirdPartyOAuth20InAppBrowserViewController(request: request)!
//     naverSignInVC.parentOrientation = UIInterfaceOrientation(rawValue: UIDevice.current.orientation.rawValue)!
//     present(naverSignInVC, animated: false, completion: nil)
  }
  
  // 로그인에 성공했을 경우 호출
  func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
    print("[Success] : Success Naver Login")
    getNaverInfo()
  }
  
  // 접근 토큰 갱신
  func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
    
  }
  
  // 로그아웃 할 경우 호출(토큰 삭제)
  func oauth20ConnectionDidFinishDeleteToken() {
    loginInstance?.requestDeleteToken()
  }
  
  // 모든 Error
  func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
    print("[Error] :", error.localizedDescription)
  }
}
