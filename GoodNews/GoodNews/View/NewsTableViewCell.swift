//
//  NewsTableVIewCell.swift
//  GoodNews
//
//  Created by Vishnu Prabhu Rama Chandran on 2/11/23.
//

import Foundation
import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var descriptionView: UILabel!
    
    func set(viewModel: NewsViewModel) {
        titleView.text = viewModel.title
        descriptionView.text = viewModel.description
    }
}
