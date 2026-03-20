//
//  NetworkProtocol.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/20/26.
//

import Foundation

/// A protocol describing an asynchronous API service capable of fetching and decoding
/// any decodable type from a remote URL.
/// Enables dependency injection for:
/// - Unit tests (via MockAPIService)
/// - Production networking ( APISerxice') protocol APIServiceProtocol (

protocol APIServiceProtocol {
    func fetch<T: Decodable>(from urlString: String) async throws -> T
}

protocol APIHandlerProtocol {
    func performRequest(_ url: URL) async throws -> Data
}
