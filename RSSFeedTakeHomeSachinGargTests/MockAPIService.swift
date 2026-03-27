//
//  MockAPIService.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

import XCTest
@testable import RSSFeedTakeHomeSachinGarg

class MockAPIService: APIServiceProtocol {
    var mockResult: Any?
    var shouldThrow: AppError?
    
    func fetch<T>(from urlString: String) async throws -> T where T : Decodable {
        if let error = shouldThrow {
            throw error
        }
        return mockResult as! T
    }
}
