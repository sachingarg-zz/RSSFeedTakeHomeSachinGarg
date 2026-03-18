//
//  MockAPIService.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

import Foundation

class MockAPIService: APIServiceProtocol {
    var mockResult: Any?
    var shouldThrow = false
    
    func fetch<T>(from url: URL) async throws -> T where T : Decodable {
        if shouldThrow {
            throw URLError(.badServerResponse)
        }
        return mockResult as! T
    }
    
}
