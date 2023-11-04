//
//  OrdersListViewControllerTableViewController.swift
//  HotCoffee
//
//  Created by Vishnu Prabhu Rama Chandran on 3/11/23.
//

import UIKit

class OrdersListViewController: UITableViewController {
    
    let viewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.populateOrders()
        viewModel.updateUI = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}

extension OrdersListViewController {
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        let order = viewModel.order(at: indexPath.row)
        cell.textLabel?.text = order.type
        cell.detailTextLabel?.text = order.size
        return cell
    }
}

extension OrdersListViewController: AddCoffeeOrderDelegate {
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController) {
        viewModel.orderList.append(OrderViewModel(order))
        viewModel.updateUI()
        self.navigationController?.popViewController(animated: true)
    }
    
    func addCoffeeOrderViewControllerDidCancel(controller: UIViewController) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? AddOrderViewController else {
            return
        }
        destination.delegate = self
    }

}
