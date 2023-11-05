//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Vishnu Prabhu Rama Chandran on 4/11/23.
//

import Foundation
import UIKit

protocol AddWeatherDelegate: NSObject {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    internal weak var delegate: AddWeatherDelegate?
    
    private let viewModel = AddWeatherViewModel()
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveCityButtonPressed() {
        let cityName = cityNameTextField.text ?? ""
        viewModel.addWeather(for: cityName) { weatherVM in
            self.delegate?.addWeatherDidSave(vm: weatherVM)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
