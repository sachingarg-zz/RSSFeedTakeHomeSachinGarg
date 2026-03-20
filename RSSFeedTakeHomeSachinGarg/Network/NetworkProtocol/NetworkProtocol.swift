//
//  NetworkProtocol.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/20/26.
//

import Foundation

protocol APIServiceProtocol {
    func fetch<T: Decodable>(from urlString: String) async throws -> T
}

protocol APIHandlerProtocol {
    func performRequest(_ url: URL) async throws -> Data
}
