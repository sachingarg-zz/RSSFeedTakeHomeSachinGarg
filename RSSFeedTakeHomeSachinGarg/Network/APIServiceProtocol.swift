//
//  APIServiceProtocol.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

import Foundation

protocol APIServiceProtocol {
    func fetch<T: Decodable>(from url: URL) async throws -> T
}
