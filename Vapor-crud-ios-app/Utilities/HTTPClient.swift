//
//  HTTPClient.swift
//  Vapor-crud-ios-app
//
//  Created by Md Refat Hossain on 03/12/2024.
//

import Foundation
import Combine

enum HttpError: Error {
    case badURL
    case badResponse
    case errorDecodingData
    case invalidUrl
}

class HTTPClient {
    private init() {}
    
    static let shared = HTTPClient()
    
    func fetch<T: Codable>(url: URL) async throws -> [T] {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw HttpError.badResponse
        }
        
        guard let object = try? JSONDecoder().decode([T].self, from: data) else {
            throw HttpError.errorDecodingData
        }
        return object
    }
}
