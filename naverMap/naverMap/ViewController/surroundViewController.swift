//
//  surroundViewController.swift
//  naverMap
//
//  Created by JUNI on 2022/09/04.
//

import NMapsMap
import UIKit
import Alamofire
import CoreLocation

class LocationService {
    
    static var shared = LocationService()
    var longitude:Double!
    var latitude:Double!
  
}



class surroundViewController: UIViewController,CLLocationManagerDelegate {

    let myStoryBoard : UIStoryboard = UIStoryboard(name : "surroundings", bundle: nil)
    

    
    //    var locationManager:CLLocationManager?
    var currentLocation:CLLocationCoordinate2D!
    
//    private func requestAuthorization() {
//           if locationManager == nil {
//               locationManager = CLLocationManager()
//               //정확도를 검사한다.
//               locationManager!.desiredAccuracy = kCLLocationAccuracyBest
//               //앱을 사용할때 권한요청
//               locationManager!.requestWhenInUseAuthorization()
//               locationManager!.delegate = self
//               locationManagerDidChangeAuthorization(locationManager!)
//           }else{
//               //사용자의 위치가 바뀌고 있는지 확인하는 메소드
//               locationManager!.startMonitoringSignificantLocationChanges()
//           }
//       }
//
    
    //날씨 데이터 설정
    @IBOutlet weak var wI1: UIImageView!
    @IBOutlet weak var wI2: UIImageView!
    @IBOutlet weak var wI3: UIImageView!
    @IBOutlet weak var wI4: UIImageView!

    @IBOutlet weak var wL1: UILabel!
    @IBOutlet weak var wL2: UILabel!
    @IBOutlet weak var wL3: UILabel!
    @IBOutlet weak var wL4: UILabel!
//
//    var currentWeather:CurrentWeather!
//    var hourlyWeathers:[HourlyWeather] = []
    ////여기까지
    
    @IBOutlet weak var address: UILabel!
    
    @IBOutlet weak var temp_max: UILabel!
//    @IBOutlet weak var menu: UIButton!
    @IBOutlet weak var temp_min: UILabel!
    @IBOutlet weak var chomise: UILabel!
    @IBOutlet weak var mise: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var max_img: UIImageView!
    @IBOutlet weak var min_img: UIImageView!
    
   
    @IBOutlet weak var smartAround: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    
    
    
    var formatter_time = DateFormatter()
    
  
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        requestAuthorization()

        mainView.layer.cornerRadius = 20
        mainView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)


        self.view.addSubview(self.mainView)
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        self.address.isHidden = true

        let geocoder = CLGeocoder.init()
        let location = self.locationManager.location
        if location != nil{
            geocoder.reverseGeocodeLocation(location!) { [self] (placemarks, error) in
                            if error != nil {
                                return
                            }
                            if let placemark = placemarks?.first {
                                var Address = ""
                                
//                                if let administrativeArea = placemark.administrativeArea {
//                                    Address = "\(Address) \(administrativeArea) "
//                                    print(administrativeArea) //시
//                                }
                                
//                                if let locality = placemark.locality {
//                                    Address = "\(Address) \(locality) " //구
//                                }
//

                                
                                if let subocality = placemark.subLocality {
                                    Address = "\(Address) \(subocality) " //구
                                }
            
//                                if let thoroughfare = placemark.thoroughfare {
//                                    Address = "\(Address) \(thoroughfare) " //동
//                                }
                                
                                self.address.text = Address
                                self.address.isHidden = false

                            }
                

                        }
        }
        
        
        let coor = locationManager.location?.coordinate
        LocationService.shared.latitude = coor?.latitude
        LocationService.shared.longitude = coor?.longitude
        
      
        
        
        
        
//        print(LocationService.shared.latitude)
        oValueRequest().getoValueData(self)
        tempRequest().gettempData(self)
//        HourlyWeather().getHourlyWeather(self)
//        self.view.addSubview(self.menu)
//        requestAuthorization()
        
        formatter_time.dateFormat = "HH"
        let time = Int(formatter_time.string(from: Date()))
        self.wL1.text = String(time!) + "시"
        self.wL2.text = String(time!+1) + "시"
        self.wL3.text = String(time!+2) + "시"
        self.wL4.text = String(time!+3) + "시"
                          

        
        
        if let nick = UserDefaults.standard.string(forKey:"nickname") {
            self.smartAround.text = nick + "님을 위한 오늘의 PICK!"
           
            self.label1.isHidden = true
            self.label2.isHidden = true
            self.label3.isHidden = true
            self.label4.isHidden = true
            self.label5.isHidden = true
            self.label6.isHidden = true

            
        }
        else {
            self.smartAround.text = "주변"
            
            if time!<=06 && time!>=00{
                    self.label1.text = "심야"
            }
            else if time!<=11 && time!>=07{
                    self.label1.text = "아침"
            }
            else if time!<=16 && time!>=12{
                    self.label1.text = "점심"
            }
            else {
                    self.label1.text = "저녁"
            }

        }
        
    }
    

}

//////////////////////// 미세먼지 세팅
extension surroundViewController{
    func didSuccess_ovalue(_ response: oValueResponses){
        let mise = response.response.body.items[0].pm10Grade
        let chomise = response.response.body.items[0].pm25Grade

        switch mise {
            case "1" :
              self.mise.text = "좋음"
            case "2" :
              self.mise.text = "보통"
            case "3" :
              self.mise.text = "나쁨"
            case "4" :
              self.mise.text = "매우나쁨"
        default :
            self.mise.text = "보통"
        }
        
        switch chomise {
            case "1" :
              self.chomise.text = "좋음"
            case "2" :
              self.chomise.text = "보통"
            case "3" :
              self.chomise.text = "나쁨"
            case "4" :
              self.chomise.text = "매우나쁨"
        default :
            self.chomise.text = "보통"
        }
    }
}



//////////////////// 날씨 세팅

extension surroundViewController{
    func didSuccess_temp(_ response: weatherToday){
        /// ----format 에러로  반영안됨
        let min = response.main.temp_max
//        let max = response.main.temp_max
//        let img_min = response.weather[0].icon
        
        self.wL1.text = "오전 \(String(describing: (min)))"
//        min_img.image = UIImage(named: response.weather[0].icon)
//        self.temp_max.text = "오후 \(String(describing: (max)))"


      
    }
}

//
//
//extension surroundViewController{
//    func didSuccess_hourly(_ response: hourly){
//
//        print("succes")
//
////        let min = response.
//
////        let max = response.main.temp_max
////        let img_min = response.weather[0].icon
//
////        self.temp_min.text = "오전 \(String(describing: (min)))"
////        min_img.image = UIImage(named: response.weather[0].icon)
////        self.temp_max.text = "오후 \(String(describing: (max)))"
////
////        wI1.image = getWeatherIconFor(HourlyWeather.weatherIcon)
//
//
//    }
//}
//



