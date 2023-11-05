//
//  AddWeatherViewModel.swift
//  GoodWeather
//
//  Created by Vishnu Prabhu Rama Chandran on 4/11/23.
//

import Foundation

class AddWeatherViewModel {
    var selectedUnit: Unit {
        get {
            let defaults = UserDefaults.standard
            let unit = defaults.value(forKey: "Unit") as? String ?? ""
            return unit.isEmpty ? Unit.celcius : Unit(rawValue: unit)!
        }
    }
    
    func addWeather(for city: String, completion: @escaping (WeatherViewModel) -> Void) {
        let weatherUrl = Constants.Urls.urlForWeatherByCity(city, in: selectedUnit)
        let weatherResource = Resource<WeatherResponse>(url: weatherUrl)
        WeatherRepository().load(resource: weatherResource) { response in
            let vm = WeatherViewModel(weather: response)
            completion(vm)
        }
    }
}
