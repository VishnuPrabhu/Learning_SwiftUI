//
//  NewsListViewController.swift
//  GoodNews
//
//  Created by Vishnu Prabhu Rama Chandran on 2/11/23.
//

import Foundation
import UIKit

class NewsListViewController : UITableViewController {
    
    var viewModel: NewsListViewModel!
    
    @IBOutlet var newsListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        apiCall()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        viewModel = NewsListViewModel()
    }
    
    private func apiCall() {
        viewModel.getNewsList()
        viewModel.onUpdateNewsList = {
            self.newsListTableView.reloadData()
        }
    }
}

extension NewsListViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.noOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.noOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as! NewsTableViewCell
        let news = viewModel.newsForIndex(index: indexPath.row)!
        cell.set(viewModel: NewsViewModel(newsArticle: news))
        return cell
    }
}
