//
//  newsvm.swift
//  JustNews
//
//  Created by G on 31/01/2024.
//

import Foundation
class NewsViewModel1 {
    private let newsDataService: NewsDataServiceProtocol
    var newsItems: [NewsModel] = [] // An array to store news stories

    init(service: NewsDataServiceProtocol) {
        self.newsDataService = service
    }

    // Function to fetch news stories
    func fetchNews(completion: @escaping () -> Void) {
        newsDataService.fetchTopStories { [weak self] result in
            switch result {
            case .success(let stories):
                self?.newsItems = stories
                completion()
            case .failure(let error):
                print("Error fetching news: \(error)")
                completion()
            }
        }
    }
}
