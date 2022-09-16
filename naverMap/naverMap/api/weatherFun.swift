//
//  weatherFun.swift
//  naverMap
//
//  Created by JUNI on 2022/09/13.
//

import Foundation
import UIKit

//Double로 오는 타임스탬프 데이트 형식으로 변환
func currentDateFromUnix(unixDate:Double?) -> Date? {
    if unixDate != nil {
        return Date(timeIntervalSince1970: unixDate!)
    }else{
        return Date()
    }
}

//날씨 아이콘 이름에 따라서 이미지로 변환
func getWeatherIconFor(_ type:String) -> UIImage? {
    return UIImage(named: type)
}
import Foundation

extension Date {
    func shortDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        return dateFormatter.string(from: self)
    }
    
    func time() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
}
