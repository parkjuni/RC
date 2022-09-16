//
//  Request.swift
//  naverMap
//
//  Created by JUNI on 2022/09/07.
//

import Foundation
import Alamofire
import CoreLocation
import SwiftyJSON


////////////////////// 미세먼지
class oValueRequest{
    func getoValueData(_ viewController : surroundViewController){
        
        let url = "https://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty?serviceKey=hTvXDP8uIDp2lGcZf1sLtdd5Knya9%2BP00%2F1pFGJGZhO%2B0mym01fX4sXDQkR8ZLrxoZ5ghmYBQ0IWqjWki7urWA%3D%3D&returnType=json&numOfRows=100&pageNo=1&stationName=%EC%A2%85%EB%A1%9C%EA%B5%AC&dataTerm=DAILY&ver=1.0"
        let params: Parameters = [
            "serviceKey" : "hTvXDP8uIDp2lGcZf1sLtdd5Knya9%2BP00%2F1pFGJGZhO%2B0mym01fX4sXDQkR8ZLrxoZ5ghmYBQ0IWqjWki7urWA%3D%3D",
            "returnType" : "json",
            "numOfRows" : "100",
            "pageNo" : "1",
            "stationName" : "양천구",
            "dataTerm" : "DAILY",
            "ver" : "1.0"
            
        ]
        
        AF.request(url,
                   method: .get,
        parameters: params,
                   headers: nil)
        .responseDecodable(of: oValueResponses.self){ response in
            
            switch response.result {
            case.success(let response):
                print("DEBUG")
                viewController.didSuccess_ovalue(response)
            case.failure(let error):
                print("오류 \(error.localizedDescription)")
            }
            
        }
        
        
        
    }
}

////////////////////// 날씨
class tempRequest{
 
    func gettempData(_ viewController : surroundViewController){
        
//        print(LocationService.shared.latitude)
//        let lon = LocationService.shared.longitude!
//        let lat = LocationService.shared.latitude!
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=127&lon=35&appid=5528618de2d263dd6c1a4346e8ad33f8&units=metric"
       
        let params: Parameters = [
            "lat" : "127",
            "lon" : "35",
            "appid" : "5528618de2d263dd6c1a4346e8ad33f8",
            "units" : "metric",

        ]
//
        AF.request(url,
                   method: .get,
        parameters: params,
                   headers: nil)
        .responseDecodable(of: weatherToday.self){ response in
            
            switch response.result {
            case.success(let response):
                print("DEBUG")
                viewController.didSuccess_temp(response)
            case.failure(let error):
                print("오류 \(error.localizedDescription)")
            }
            
        }
        
    }
}

//class CurrentWeather{
//    var city:String = ""
//    var date:String = ""
//    var temp:Double = 0.0
//    var weatherInfo:String = ""
//
//
//    func getCurrentWeather(completion:@escaping() -> Void) {
//           let lon = LocationService.shared.longitude!
//           let lat = LocationService.shared.latitude!
//           let path =  "https://api.weatherbit.io/v2.0/current?lat=\(lat)&lon=\( lon)&key=20f030cf15144891939a1f404a120e02&include=minutely"
//
//           AF.request(path).responseJSON { (response) in
//               let result = response.result
//
//               switch result {
//
//               case .success(let value as [String:Any]):
//                   let json = JSON(value)
//                   let data = json["data"][0]
//                   self.city = data["city_name"].stringValue
//                   self.date = currentDateFromUnix(unixDate: data["ts"].double)?.shortDate() ?? ""
//                   self.temp = data["temp"].double ?? 0.0
//                   self.weatherInfo = data["weather"]["description"].stringValue
//                   completion()
//
//               case .failure(let error):
//                   print(error.errorDescription ?? "")
//               default:
//                   fatalError()
//               }
//           }
//       }
//}

//class HourlyWeather {
////
//    var date:String = ""
//    var temp:Double = 0.0
//    var weatherIcon:String = ""
//
//    init(weatherDictionary:Dictionary<String,Any>) {
//        let data = JSON(weatherDictionary)
//        self.date = currentDateFromUnix(unixDate: data["ts"].double)?.time() ?? ""
//        self.temp = data["temp"].double ?? 0.0
//        self.weatherIcon = data["weather"]["icon"].stringValue
//    }
//
//
//    class func getHourlyWeather(completion:@escaping([HourlyWeather]) -> Void) {
//
//           let lon = LocationService.shared.longitude!
//           let lat = LocationService.shared.latitude!
//
//        let path = "https://api.weatherbit.io/v2.0/forecast/hourly?lat=\(lat)&lon=\(lon)&key=20f030cf15144891939a1f404a120e02"
//
////
////      AF.request(path,
////                   method: .get,
////                   headers: nil)
////        .responseDecodable(of: hourly.self){ response in
////
////            switch response.result {
////            case.success(let response):
////                print("DEBUG")
////                viewController.didSuccess_hourly(response)
////            case.failure(let error):
////                print("오류 \(error.localizedDescription)")
////
////
////            }
////
////        }
//
//        AF.request(path).responseJSON { (response) in
//            let result = response.result
//            var hourlyWeathers = [HourlyWeather]()
//
//            switch result {
//
//            case .success(let value as [String:Any]):
//                    if let data = value["data"] as? [Dictionary<String,AnyObject>] {
//                        data.forEach{hourlyWeathers.append(HourlyWeather(weatherDictionary: $0))}
//                    }
//                completion(hourlyWeathers)
//
//            case .failure(let error):
//                print(error.errorDescription ?? "")
//            default:
//                fatalError()
//            }
//        }
//    }
//}
//
