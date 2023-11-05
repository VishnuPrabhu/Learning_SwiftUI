//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Vishnu Prabhu Rama Chandran on 4/11/23.
//

import Foundation

class WeatherListViewModel {
    
    var updateUI: () -> Void = {}
    
    private var weatherList: [WeatherViewModel] = []
    
    func addWeatherViewModel(_ vm: WeatherViewModel) {
        weatherList.append(vm)
        updateUI()
    }
    
    var selectedUnit: Unit {
        get {
            let defaults = UserDefaults.standard
            let unit = defaults.value(forKey: "Unit") as? String ?? ""
            return unit.isEmpty ? Unit.celcius : Unit(rawValue: unit)!
        }
    }
    
    func numebrOfRows(_ section: Int) -> Int {
        return weatherList.count
    }
    
    func model(at index: Int) -> WeatherViewModel {
        return weatherList[index]
    }
    
    func updateUnit(unit: Unit) {
        switch unit {
        case .celcius:
            toCelcius()
        case .farenheit:
            toFarenheit()
        }
    }
    
    func toCelcius() {
        weatherList = weatherList.map { weatherVM in
            weatherVM.temperature = ((Double(weatherVM.temperature.removeDegreeSymbol())! - 32) * 5/9).formatAsDegree()
            return weatherVM
        }
        updateUI()
    }
    
    func toFarenheit() {
        weatherList = weatherList.map { weatherVM in
            weatherVM.temperature = ((Double(weatherVM.temperature.removeDegreeSymbol())! * 9/5) + 32).formatAsDegree()
            return weatherVM
        }
        updateUI()
    }
}
