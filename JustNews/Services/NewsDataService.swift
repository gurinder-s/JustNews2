//
//  NewsDataService.swift
//  JustNews
//
//  Created by G on 31/01/2024.
//

import Foundation

class NewsDataService: NewsDataServiceProtocol{
    private let baseAPIUrl = "http://api.thenewsapi.com/v1/news/"
    
    func fetchTopStories(completion: @escaping (Result<[NewsModel], NewsDataServiceError>) -> Void) {
        //Construct the URL
        guard let url = URL(string: baseAPIUrl + Endpoint.topStories.rawValue) else {return}
        
        //URL Session data task to get data object
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    if let error = error {
                        completion(.failure(.networkError(error)))
                        return
                    }
                    //Making sure we got data otherwise return data not found
                    guard let data = data else {
                        completion(.failure(.dataNotFound))
                        return
                    }
                    
                    do {
                        let newsArray = try JSONDecoder().decode([NewsModel].self, from: data)
                        completion(.success(newsArray))
                    } catch {
                        completion(.failure(.jsonParsingError(error)))
                    }
                }
                task.resume()
    }
    
    func fetchStoryByUUID(_ uuid: String, completion: @escaping (Result<NewsModel, NewsDataServiceError>) -> Void) {
        <#code#>
    }
    
    
    
    
    
}
