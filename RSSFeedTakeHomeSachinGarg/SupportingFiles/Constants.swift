//
//  Constants.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import Foundation

enum FeedType: String, Identifiable, CaseIterable {
    case music = "Music Feed"
    case podcasts = "Podcast Feed"
    case apps = "Apps Feed"
    case books = "Books Feed"
    
    var id: String { rawValue }
    
    var url: URL {
        switch self {
        case .music:
            return URL(string: "https://rss.marketingtools.apple.com/api/v2/us/music/most-played/10/albums.json")!
        case .podcasts:
            return URL(string: "https://rss.marketingtools.apple.com/api/v2/us/podcasts/top/10/podcasts.json")!
        case .apps:
            return URL(string: "https://rss.marketingtools.apple.com/api/v2/us/apps/top-free/10/apps.json")!
        case .books:
            return URL(string: "https://rss.marketingtools.apple.com/api/v2/us/books/top-free/10/books.json")!
        }
    }
    
    var iconName: String {
        switch self {
        case .music:
            "music.note"
        case .podcasts:
            "mic.fill"
        case .apps:
            "app.fill"
        case .books:
            "book.closed.fill"
        }
    }
}


