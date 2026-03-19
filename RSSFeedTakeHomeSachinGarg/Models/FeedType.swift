//
//  FeedType1.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

import Foundation
import SwiftUI

enum FeedType: String, Identifiable, CaseIterable {
    case music = "Album Feed"
    case podcasts = "Podcast Feed"
    case apps = "Apps Feed"
    case books = "Books Feed"
    case audioBooks = "Audio Books"
    
    var id: String { rawValue }
    
    var baseURL: String {
        switch self {
        case .music:
            return "https://rss.marketingtools.apple.com/api/v2/us/music/most-played"
        case .podcasts:
            return "https://rss.marketingtools.apple.com/api/v2/us/podcasts/top"
        case .apps:
            return "https://rss.marketingtools.apple.com/api/v2/us/apps/top-free"
        case .books:
            return "https://rss.marketingtools.apple.com/api/v2/us/books/top-free"
        case .audioBooks:
            return "https://rss.marketingtools.apple.com/api/v2/us/audio-books/top"
        }
    }
    
    var endPoint: String {
        switch self {
        case .music:
            "albums"
        case .podcasts:
            "podcasts"
        case .apps:
            "apps"
        case .books:
            "books"
        case .audioBooks:
            "audio-books"
        }
    }
    
    var iconName: String {
        switch self {
        case .music:
            "music.note.list"
        case .podcasts:
            "mic.fill"
        case .apps:
            "app.fill"
        case .books:
            "book.fill"
        case .audioBooks:
            "headphones"
        }
    }
    
    //Colors
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

extension FeedType {
    func url(limit: Int) -> URL {
        let fullString = "\(baseURL)/\(limit)/\(endPoint).json"
        return URL(string: fullString)!
    }
}

