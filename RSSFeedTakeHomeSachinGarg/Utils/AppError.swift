//
//  AppError.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

import Foundation


/// Represents errors that can occur while fetching or decoding RSS da
///
/// Cases include:
/// - invaliduRL
/// - network
/// - decoding
/// - unknown
///
/// Conforms to:
/// - 'LocalizedError
/// - Equatable' (custom implementation)

enum AppError: Error {
    case invalicUrl
    case invalidResponse
    case networkError(URLError)
    case decodingFailure(Error)
    case unknown(Error)
    case serverError(Int)
    
    var errorDescription: String? {
        switch self {
        case .invalicUrl:
            return "The URl is invalid."
        case .networkError(let error):
            return "Network Error: \(error.localizedDescription)"
        case .decodingFailure(let error):
            return  "Decoding failed. \(error.localizedDescription)"
        case .unknown:
            return "Unknwon error occured."
        case .invalidResponse:
            return "invalidResponse recieved"
        case .serverError(let statusCode):
            return "Server Error \(statusCode)"
        }
    }
    
    var code: Int {
        switch self {
        case .invalicUrl: return 1
        case .invalidResponse: return 2
        case .networkError(_): return 3
        case .decodingFailure(_): return 4
        case .unknown(_): return 5
        case .serverError(_): return 6
        }
    }
}
