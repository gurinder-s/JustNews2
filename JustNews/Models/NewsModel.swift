//
//  NewsModel.swift
//  JustNews
//
//  Created by G on 31/01/2024.
//

import Foundation

struct NewsResponse: Codable{
    let meta: Meta
    let data: [NewsModel]
}

struct NewsModel: Codable{

    let uuid: String
    let title: String
    let description: String
    let keywords: String
    let snippet: String
    let url: String
    let imageURL: String
    let language: String
    let publishedAt: String
    let source: String
    let categories: [String]
    let relevanceScore: Int
    let locale: String
    
    enum CodingKeys: String, CodingKey{
        case uuid,title,description,keywords,snippet,url,language,source,categories,locale
        case imageURL = "image_url"
        case publishedAt = "published_at"
        case relevanceScore = "relevance_score"
    }
    


}

struct Meta: Codable{
    let found: Int
    let returned: Int
    let limit: Int
    let page: Int
}
