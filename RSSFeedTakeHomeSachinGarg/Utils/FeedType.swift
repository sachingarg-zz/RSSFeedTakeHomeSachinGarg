//
//  FeedType1.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

import Foundation
import SwiftUI

enum FeedType: String, Identifiable, CaseIterable {
    case music
    case podcasts
    case apps
    case books
    case audioBooks
    
    var id: String { rawValue }
    
    var baseURL: String {
        switch self {
        case .music:
            return Constants.RSSBaseURL.albums
        case .podcasts:
            return Constants.RSSBaseURL.podcasts
        case .apps:
            return Constants.RSSBaseURL.apps
        case .books:
            return Constants.RSSBaseURL.books
        case .audioBooks:
            return Constants.RSSBaseURL.audioBooks
        }
    }
    
    var endPoint: String {
        switch self {
        case .music:        return Constants.EndPoints.albums
        case .podcasts:     return Constants.EndPoints.podcasts
        case .apps:         return Constants.EndPoints.apps
        case .books:        return Constants.EndPoints.books
        case .audioBooks:   return Constants.EndPoints.audioBooks
        }
    }
    
    var iconName: String {
        switch self {
        case .music:        return Constants.FeedIcons.albums
        case .podcasts:     return Constants.FeedIcons.podcasts
        case .apps:         return Constants.FeedIcons.apps
        case .books:        return Constants.FeedIcons.books
        case .audioBooks:   return Constants.FeedIcons.audioBooks
        }
    }
    
    // Mark: - Colors
    var gradient: [Color] {
        switch self {
        case .music:
            return [.red, .purple]
        case .podcasts:
            return [.purple, .pink]
        case .apps:
            return [.blue, .purple]
        case .books:
            return [.orange, .red]
        case .audioBooks:
            return [.teal, .cyan]
        }
    }
}

/// Builds the full RSS URL by injecting the selected item limit.
/// Example:
/// let url = FeedType.apps.url(limit: 25)
///
/// Final URL format:
///*•
/// https://rss.marketingtools.apple.com/api/v2/us/apps/top-free/25/apps.json
/// 
extension FeedType {
    func urlString(limit: Int) -> String {
        let fullString = "\(baseURL)/\(limit)/\(endPoint).json"
        return fullString
    }
}

