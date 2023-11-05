//
//  Constants.swift
//  GoodWeather
//
//  Created by Vishnu Prabhu Rama Chandran on 4/11/23.
//

import Foundation

struct Constants {
    
    struct Urls {
        static func urlForWeatherByCity(_ city: String, in unit: Unit) -> URL {
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=0bb401253974a093668135ecc5c78978&units=\(unit.rawValue)")!
        }
    }
}
