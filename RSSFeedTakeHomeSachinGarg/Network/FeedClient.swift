//
//  FeedClient.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/16/26.
//

import Foundation

protocol FeedClientProtocol {
    func fetchFeed(from url: URL) async throws -> Data
}

class FeedClient: FeedClientProtocol {
    func fetchFeed(from url: URL) async throws -> Data {
        let dataRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: dataRequest)
        guard let response = response as? HTTPURLResponse,
              (200..<300).contains(response.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return data
    }
}
