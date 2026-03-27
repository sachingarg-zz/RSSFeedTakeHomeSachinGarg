//
//  AppItem.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

/// A model representing a AppItem item returned from Apple RSS feed.
///
/// Example JSON:
/// "id": "123"
/// "name": "Sample App"
/// "artistName": "Author"
/// "releaseDate": "2024-01-01"
/// "url": "www.apple.com/feed/ultra.pnc"
///
/// Conforms to:
/// - 'Decodable'
/// - Identifiable"
///

struct AppItem: Decodable, Identifiable {
    let id: String
    let artistName: String
    let name: String
    let artworkUrl100: String
    let releaseDate: String
    let url: String
}

/// An extension use at UI representing a AppItem item.
/// Conforms to:
/// - FeedDisplayable

extension  AppItem: FeedDisplayable {
    var titleText: String { name }
    var subtitleText: String { artistName }
    var artworkUrl: String { artworkUrl100 }
    var previewUrlText: String? { nil }
    var storeUrlText: String? { url }
    var releaseDateText: String { releaseDate }
    var categoryText: String { "App" }
}
