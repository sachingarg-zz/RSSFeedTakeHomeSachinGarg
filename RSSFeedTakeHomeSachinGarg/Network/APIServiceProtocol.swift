//
//  APIServiceProtocol.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import Foundation

protocol APIServiceProtocol {
    func fetch<T: Decodable>(from url: URL) async throws -> T
}

final class APIService: APIServiceProtocol {
    func fetch<T>(from url: URL) async throws -> T where T : Decodable {
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
