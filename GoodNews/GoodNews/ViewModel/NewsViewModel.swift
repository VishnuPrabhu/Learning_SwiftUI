//
//  NewsViewModel.swift
//  GoodNews
//
//  Created by Vishnu Prabhu Rama Chandran on 2/11/23.
//

import Foundation

struct NewsViewModel {
    let newsArticle: NewsArticle
    
    init(newsArticle: NewsArticle) {
        self.newsArticle = newsArticle
    }
    
    var title: String {
        newsArticle.title
    }
    
    var description: String {
        newsArticle.description
    }
}
