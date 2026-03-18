//
//  AppError.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

import Foundation

enum AppError: LocalizedError, Equatable {
    case invalicUrl
    case networkError(URLError)
    case decodingFailure
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalicUrl:
            return "The URl is invalid."
        case .networkError(let error):
            return "Network Error: \(error.localizedDescription)"
        case .decodingFailure:
            return  "Decding failed."
        case .unknown:
            return "Unknwon error occured."
        }
    }
}
