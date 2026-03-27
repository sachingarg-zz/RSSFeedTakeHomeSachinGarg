//
//  File.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/20/26.
//

import Foundation

class APIHandler: APIHandlerProtocol {
    func performRequest(_ url: URL) async throws -> (Data, URLResponse) {
        do {
            return try await URLSession.shared.data(from: url)
        } catch let error as URLError {
            throw AppError.networkError(error)
        } catch {
            throw AppError.unknown(error)
        }
    }
}
