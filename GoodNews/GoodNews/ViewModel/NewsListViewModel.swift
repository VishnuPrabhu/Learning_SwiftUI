//
//  NewsListViewModel.swift
//  GoodNews
//
//  Created by Vishnu Prabhu Rama Chandran on 2/11/23.
//

import Foundation

class NewsListViewModel {
    
    var newsLists: [NewsArticle] = []
    var noOfSections: Int = 1
    var noOfRows: Int {
        newsLists.count
    }
    var onUpdateNewsList: () -> Void = {}
    
    func getNewsList() {
        NewsArticleRepository().getNews { [weak self] list in
            if let list = list {
                self?.newsLists = list
                self?.onUpdateNewsList()
            }
        }
    }
    
    func newsForIndex(index: Int) -> NewsArticle? {
        return newsLists[index]
    }
}
