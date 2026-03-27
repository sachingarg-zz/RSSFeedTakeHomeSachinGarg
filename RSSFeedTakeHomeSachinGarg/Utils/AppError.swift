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

enum AppError: LocalizedError, Equatable {
    case invalicUrl
    case networkError(URLError)
    case httpStatus(Int)
    case decodingFailure(DecodingError)
    case unknown(Error)
    case noData
    
    var errorDescription: String? {
        switch self {
        case .invalicUrl:
            return Constants.Errors.invalidUrl
        case .networkError(let error):
            return "\(Constants.Errors.networkError):\(error.localizedDescription)"
        case .httpStatus(let invaliStatusCode):
            return "\(Constants.Errors.invalidStatusCode):\(invaliStatusCode)"
        case .decodingFailure(let error):
            return  "\(Constants.Errors.decodingEror):\(error.localizedDescription)"
        case .unknown(let error):
            return "\(Constants.Errors.unknownError):\(error.localizedDescription)"
        case .noData:
            return Constants.Errors.nodata
        }
    }
    
    static func == (lhs: AppError, rhs: AppError) -> Bool {
        switch (lhs, rhs) {
        case (.invalicUrl, .invalicUrl): return true
        case (.networkError(let a), .networkError(let b)): return a.code == b.code
        case (.httpStatus(let a), .httpStatus(let b)): return a == b
        case (.decodingFailure, .decodingFailure): return true
        case (.unknown, .unknown): return true
        case (.noData, .noData): return true
        default:
            return false
        }
    }
}
