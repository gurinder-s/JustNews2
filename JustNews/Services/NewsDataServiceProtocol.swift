//
//  NewsDataServiceProtocol.swift
//  JustNews
//
//  Created by G on 31/01/2024.
//

import Foundation

protocol NewsDataServiceProtocol{
    func fetchTopStories(completion: @escaping (Result<[NewsModel], NewsDataServiceError>) -> Void)
    func fetchStoryByUUID(_ uuid: String, completion: @escaping (Result<NewsModel, NewsDataServiceError>) -> Void)
}

enum Endpoint:String{
    case topStories = "top"
    case byUUID = "uuid/"
}
