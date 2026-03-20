//
//  File.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/20/26.
//

import Foundation

class APIHandler: APIHandlerProtocol {
     func performRequest(_ url: URL) async throws -> Data {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpresponse = response as? HTTPURLResponse else {
                throw AppError.invalidResponse
            }
            
            guard (200...299).contains(httpresponse.statusCode) else {
                throw AppError.serverError(httpresponse.statusCode)
            }
            
            return data
    }
}
