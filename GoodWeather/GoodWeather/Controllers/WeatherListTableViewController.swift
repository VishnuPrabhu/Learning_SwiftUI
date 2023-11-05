//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Vishnu Prabhu Rama Chandran on 4/11/23.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController {
    
    private let viewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarAppearance()
        viewModel.updateUI = {
            self.tableView.reloadData()
        }
    }
    
    private func setNavigationBarAppearance() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Navigation
extension WeatherListTableViewController: AddWeatherDelegate, SettingsDelegate {
    
    @IBAction func navigateToAddCity() {
        performSegue(withIdentifier: "navigateToAddCity", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navigateToAddCity", let addVC = segue.destination as? AddWeatherCityViewController {
            addVC.delegate = self
        } else if segue.identifier == "navigateToSettings", let navVC = segue.destination as? UINavigationController, let settingsVC = navVC.viewControllers.first as? SettingsTableViewController {
            settingsVC.delegate = self
        }
        
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        viewModel.addWeatherViewModel(vm)
    }
    
    @IBAction func openSettings() {
        performSegue(withIdentifier: "navigateToSettings", sender: self)
    }
    
    func settingsDone(vm: SettingsViewModel) {
        viewModel.updateUnit(unit: vm.selectedUnit)
    }
}

// MARK: - Delegate
extension WeatherListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numebrOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        cell.configure(vm: viewModel.model(at: indexPath.row))
        return cell
    }
}
