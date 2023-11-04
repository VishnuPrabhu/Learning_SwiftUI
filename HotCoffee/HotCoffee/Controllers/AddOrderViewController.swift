//
//  AddOrderViewController.swift
//  HotCoffee
//
//  Created by Vishnu Prabhu Rama Chandran on 3/11/23.
//

import UIKit

protocol AddCoffeeOrderDelegate {
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController)
    func addCoffeeOrderViewControllerDidCancel(controller: UIViewController)
}

class AddOrderViewController: UIViewController {
    var delegate: AddCoffeeOrderDelegate? = nil
    
    private let viewModel = AddCoffeeOrderViewModel()
    
    @IBOutlet weak var addOrderTableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    private var segmentView: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
    }
    
    private func addSubViews() {
        segmentView = UISegmentedControl(items: viewModel.sizes)
        segmentView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(segmentView)
        
        segmentView.topAnchor.constraint(equalTo: addOrderTableView.bottomAnchor, constant: 20).isActive = true
        segmentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    @IBAction func saveOrder(_ sender: Any) {
        viewModel.name = nameTextField.text
        viewModel.email = emailTextField.text
        viewModel.selectedType = viewModel.types[addOrderTableView.indexPathForSelectedRow!.row]
        viewModel.selectedSize = viewModel.sizes[segmentView.selectedSegmentIndex]
        viewModel.save()
        viewModel.updateUI = { order in
            self.delegate?.addCoffeeOrderViewControllerDidSave(order: order, controller: self)
        }
    }
    
    @IBAction func cancel() {
        self.delegate?.addCoffeeOrderViewControllerDidCancel(controller: self)
    }
    
}

extension AddOrderViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTypeTableViewCell", for: indexPath)
        cell.textLabel?.text = viewModel.types[indexPath.row]
        return cell
    }

}

extension AddOrderViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
