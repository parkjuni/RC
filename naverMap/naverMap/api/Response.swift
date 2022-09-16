//
//  WeatherResponse.swift
//  naverMap
//
//  Created by JUNI on 2022/09/07.
//

import Foundation
import UIKit

/////////////////////////////////////////////// 미세먼지
struct oValueResponses: Decodable{
    var response : response
//    var items : [items]
    
}

struct response : Decodable{
    var body: body
    var header : header
}

struct body: Decodable{
    var totalCount : Int?
    var items : [items]
    var pageNo : Int?
    var numOfRows : Int?
}

struct header : Decodable{
    var resultMsg : String?
    var resultCode : String?
}

struct items: Decodable{
    
    var so2Grade : String?
    var coFlag: String?
    var khaiValue : String?
    var so2Value : String?
    var coValue : String?
    var pm25Flag : String?
    var pm10Flag : String?
    var pm10Value : String?
    var o3Grade : String?
    var khaiGrade : String?
    var pm25Value : String?
    var no2Flag : String?
    var no2Grade : String?
    var o3Flag : String?
    var pm25Grade : String?
    var so2Flag : String?
    var dataTime : String?
    var coGrade : String?
    var no2Value : String?
    var pm10Grade : String?
    var o3Value : String?
}


///////////////////////////////////////////////// 날씨

struct weatherToday: Decodable {
    var coord : Coord
    var weather :[Weather]
    var base : String
    var main : Main
    var visibility : Int
    var wind : Wind
    var clouds : Clouds
    var dt : Int
    var sys : Sys
    var timezone,id : Int
    var name : String
    var cod : Int
}

struct Coord: Decodable {
    var lon : Int
    var lat : Int
}

struct Weather: Decodable {
    var id : Int
    var main,description : String
//    var description : String
    var icon : String
}

struct Main: Decodable {
    var temp: Double
    var feels_like : Double
    var temp_min : Double
    var temp_max : Double
    var pressure : Int
    var humidity : Int
    var sea_level : Int
    var grnd_level : Int

}

struct Wind: Decodable {
    var speed : Double
    var deg : Int
    var gust : Double
}

struct Clouds: Decodable {
    var all : Int
}

struct Sys: Decodable {
    var country : String
    var sunrise : Int
    var sunset : Int
}



////////////////
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

//import Foundation

// MARK: - Welcome
//struct hourly: Decodable {
//    let data: [Datum]
//    let cityName: String
//    let lon: Int
//    let timezone: String
//    let lat: Int
//    let countryCode, stateCode: String
//
//    enum CodingKeys: String, CodingKey {
//        case data
//        case cityName = "city_name"
//        case lon, timezone, lat
//        case countryCode = "country_code"
//        case stateCode = "state_code"
//    }
////}
//struct hourly: Decodable {
//    let data: [Data]
//    let city_name: String?
//   let lon: Int?
//   let timezone: String?
//   let lat: Int?
//   let country_code, state_code: String?
//}
//
//struct Data: Decodable {
//    let wind_cdir: String?
//    let rh: Int?
//    let pod: String?
//    let timestamp_utc: String?
//    let pres, solar_rad, ozone: Double?
//    let weather: Weather
//    let wind_gust_spd: Double?
//    let timestamp_local: String?
//    let snow_depth, clouds, ts: Int?
//    let wind_spd: Double?
//    let pop: Int?
//    let wind_cdir_full: String?
//    let slp, dni, dewpt: Double?
//    let snow: Int?
//    let uv: Double?
//    let wind_dir, clouds_hi: Int?
//    let precip, vis, dhi, app_temp: Double?
//    let datetime: String?
//    let temp, ghi: Double?
//    let clouds_mid, clouds_low: Int?
//}
//
//// MARK: - Weather
//struct Weather: Decodable {
//    let icon: String?
//    let code: Int?
//    let description: String?
//
//}
//enum Pod: String, Decodable {
//    case d = "d"
//    case n = "n"
//}
//enum WindCdir: String, Decodable {
//    case e = "E"
//    case ene = "ENE"
//    case ese = "ESE"
//    case n = "N"
//}
//
//enum WindCdirFull: String, Decodable {
//    case east = "east"
//    case eastNortheast = "east-northeast"
//    case eastSoutheast = "east-southeast"
//    case north = "north"
//}


