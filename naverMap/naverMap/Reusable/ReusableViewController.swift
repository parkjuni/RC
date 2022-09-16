//
//  ReusableViewController.swift
//  naverMap
//
//  Created by JUNI on 2022/09/04.
//

import UIKit
import CoreLocation
import NMapsMap
import CoreLocation


class ReusableViewController: UIView, CLLocationManagerDelegate {
    let nibName = "ReusableView"    // xib 이름
    
    @IBOutlet weak var mapView: NMFNaverMapView!
    var locationManager: CLLocationManager!

    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var serchView: UIView!
    
    @IBOutlet weak var buttonS: UIScrollView!
    @IBOutlet weak var test: UIView!
    @IBOutlet weak var find: UIButton!
    
//    @IBOutlet weak var searchBar: UISearchBar!
    
//    let myStoryBoard : UIStoryboard = UIStoryboard(name : "ReusableView", bundle: nil)
//    @IBAction func sideMenu(_ sender: Any) {
//        let menu = myStoryBoard.instantiateViewController(withIdentifier : "sideMenuViewController")
////        self.show(menu, sender:self)
//    }
    
    required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           commonInit()

        locationManager = CLLocationManager()
        locationManager.delegate = self

        self.locationManager.requestWhenInUseAuthorization()
        getLocationUsagePermission()

//        self.sendSubviewToBack(view)

        mapView.showCompass = true // 나침반 모양
        mapView.showZoomControls = true // +, - 버튼
        mapView.showLocationButton = true //동그라미 버튼
        serchView.layer.cornerRadius = 5
//        searchBar.searchBarStyle = .minimal
//        searchBar.leftViewMode = .never

    }
    
    func getLocationUsagePermission() {
          //location4
          self.locationManager.requestWhenInUseAuthorization()

      }

    @IBAction func menu(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "surroundings", bundle: nil)
            let popupVC = storyBoard.instantiateViewController(withIdentifier: "SideMenuViewController")
    
//        self.show(popupVC, sender:self)

    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
           //location5
           switch status {
           case .authorizedAlways, .authorizedWhenInUse:
               print("GPS 권한 설정됨")
               self.locationManager.startUpdatingLocation() // 중요!
//               print(locationManager.location?.coordinate.latitude)
//               print(locationManager.location?.coordinate.longitude)

           case .restricted, .notDetermined:
               print("GPS 권한 설정되지 않음")
               getLocationUsagePermission()
           case .denied:
               print("GPS 권한 요청 거부됨")
               getLocationUsagePermission()
           default:
               print("GPS: Default")
           }
       }
    
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           commonInit()

       }
       
       func commonInit() {
           guard let view = loadViewFromNib() else { return }
           view.frame = self.bounds
           self.addSubview(view)
           self.addSubview(buttonS)
           self.addSubview(serchView)
           self.addSubview(find)





       }
       
       func loadViewFromNib() -> UIView? {
           let nib = UINib(nibName: nibName, bundle: nil)
           return nib.instantiate(withOwner: self, options: nil).first as? UIView
       }
       
    
    
}



