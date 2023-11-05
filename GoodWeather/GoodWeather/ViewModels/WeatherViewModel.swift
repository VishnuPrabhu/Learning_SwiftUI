//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by Vishnu Prabhu Rama Chandran on 4/11/23.
//

import Foundation

class WeatherViewModel {
    let weather: WeatherResponse
    var temperature: String
    
    init(weather: WeatherResponse) {
        self.weather = weather
        self.temperature = weather.main.temp.formatAsDegree()
    }
    
    var city: String {
        weather.name
    }
}
