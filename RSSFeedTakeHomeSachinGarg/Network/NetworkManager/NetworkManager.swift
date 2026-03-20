//
//  NetworkManager.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/20/26.
//

import Foundation

/// A service responsible for performing API
/// requests using async/await.
/// This class conforms to 'APIServiceProtocol and handles:
/// - Data fetching
/// - HTTP validation
/// - Error mapping to 'AppError"

final class APIService: APIServiceProtocol {
    let apiHandler: APIHandlerProtocol
    
    init(apiHandler: APIHandlerProtocol = APIHandler()) {
        self.apiHandler = apiHandler
    }
    
    func fetch<T>(from urlString: String) async throws -> T where T : Decodable {
        guard let url = URL(string: urlString) else {
            throw AppError.invalicUrl
        }
        let data = try await apiHandler.performRequest(url)
        return try ResponseDecoder.decode(T.self, data: data)
    }
}
