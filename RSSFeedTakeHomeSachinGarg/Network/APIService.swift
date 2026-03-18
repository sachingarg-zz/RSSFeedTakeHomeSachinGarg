//
//  APIServiceProtocol.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import Foundation

final class APIService: APIServiceProtocol {
    func fetch<T>(from url: URL) async throws -> T where T : Decodable {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpresponse = response as? HTTPURLResponse,
                  (200...299).contains(httpresponse.statusCode) else {
                throw AppError.networkError(URLError(.badServerResponse))
            }
            
            return try JSONDecoder().decode(T.self, from: data  )

        } catch let urlError as URLError {
            throw AppError.networkError(urlError)
            
        } catch let _ as DecodingError {
            throw AppError.decodingFailure
        } catch {
            throw AppError.unknown
        }
    }
}
