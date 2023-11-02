//
//  ArticleNetworkModel.swift
//  GoodNews
//
//  Created by Vishnu Prabhu Rama Chandran on 2/11/23.
//

import Foundation

struct NewsArticleList: Decodable {
    let articles: [NewsArticle]
}

struct NewsArticle: Decodable {
    let title: String
    let description: String
}
