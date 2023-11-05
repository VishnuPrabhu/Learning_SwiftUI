//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by Vishnu Prabhu Rama Chandran on 4/11/23.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(vm: WeatherViewModel) {
        titleLabel.text = vm.city
        temperatureLabel.text = vm.temperature
    }
}
