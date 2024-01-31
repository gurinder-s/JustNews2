//
//  NewsListViewModel.swift
//  JustNews
//
//  Created by G on 31/01/2024.
//

import Foundation
class NewsViewModel {
    @Published var topStories: [NewsModel] = []
    @Published var errorMessage: String?

    // Injected data service
    private var newsDataService: NewsDataServiceProtocol

    // Dependency Injection through the initializer
    init(newsDataService: NewsDataServiceProtocol) {
        self.newsDataService = newsDataService
    }

    func fetchTopStories() {
        newsDataService.fetchTopStories { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let stories):
                    self?.topStories = stories
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    // Similar function for fetchStoryByUUID can be added
}
