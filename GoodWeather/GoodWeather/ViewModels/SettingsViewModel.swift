//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by Vishnu Prabhu Rama Chandran on 4/11/23.
//

import Foundation

class SettingsViewModel {
    var units: [Unit] = Unit.allCases
    
    var updateUI: () -> Void = {}
    
    var selectedUnit: Unit {
        get {
            let defaults = UserDefaults.standard
            let unit = defaults.value(forKey: "Unit") as? String ?? ""
            return unit.isEmpty ? Unit.celcius : Unit(rawValue: unit)!
        }
        set {
            let defaults = UserDefaults.standard
            defaults.setValue(newValue.rawValue, forKey: "Unit")
            updateUI()
        }
    }
    
    func isSelectedRow(at index: IndexPath) -> Bool {
        return selectedUnit == units[index.row]
    }
}
