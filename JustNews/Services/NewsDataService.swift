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
                    // Attempting to parse the JSON into an array of NewsModel
                    do {
                        let newsArray = try JSONDecoder().decode([NewsModel].self, from: data)
                        completion(.success(newsArray)) // return the result
                    } catch {
                        completion(.failure(.jsonParsingError(error))) // handle any parsing error
                    }
                }
                task.resume()
    }
    
    func fetchStoryByUUID(_ uuid: String, completion: @escaping (Result<NewsModel, NewsDataServiceError>) -> Void) {
        // Constructing the URL for the byUUID endpoint with the given UUID
               guard let url = URL(string: baseAPIUrl + Endpoint.byUUID.rawValue + uuid) else { return }
               
               // Creating a data task to fetch data from the URL
               let task = URLSession.shared.dataTask(with: url) { data, response, error in
                   // Handling potential network errors
                   if let error = error {
                       completion(.failure(.networkError(error)))
                       return
                   }
                   
                   // Ensuring data is received
                   guard let data = data else {
                       completion(.failure(.dataNotFound))
                       return
                   }
                   
                   // Attempting to parse the JSON into a NewsModel
                   do {
                       let news = try JSONDecoder().decode(NewsModel.self, from: data)
                       completion(.success(news)) // Returning the result
                   } catch {
                       completion(.failure(.jsonParsingError(error))) // Handling JSON parsing errors
                   }
               }
               task.resume() // Starting the network task
           }
    }
    
    
    

