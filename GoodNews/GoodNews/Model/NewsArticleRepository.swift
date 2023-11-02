//
//  ArticleRepository.swift
//  GoodNews
//
//  Created by Vishnu Prabhu Rama Chandran on 2/11/23.
//

import Foundation
import Alamofire

class NewsArticleRepository {
    
    private let newsUrl = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2023-10-02&sortBy=publishedAt&apiKey=e00d15040ab64433ac9e0576523cd534")!
    
    func getNews( completion: @escaping ([NewsArticle]?) -> Void) {
        AF.request(newsUrl)
            .validate()
            .responseDecodable(of: NewsArticleList.self) { response in
                guard let result = response.value else {
                    return completion(nil)
                }
                completion(result.articles)
            }
    }
}
