//
//  NewsDataServiceError.swift
//  JustNews
//
//  Created by G on 31/01/2024.
//

import Foundation

enum NewsDataServiceError: Error {
    case networkError(Error)
    case dataNotFound
    case jsonParsingError(Error)
}
