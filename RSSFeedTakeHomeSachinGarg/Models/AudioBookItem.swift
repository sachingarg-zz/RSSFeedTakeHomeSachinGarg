//
//  AudioBookItem.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

import Foundation

/// A model representing a AudioBook item returned from Apple RSS feed.
///
/// Example JSON:
/// "id": "123"
/// "name": "Sample Audio Book"
/// "artistName": "Author"
/// "releaseDate": "2024-01-01"
/// "url": "www.apple.com/feed/ultra.pnc"
///
/// Conforms to:
/// - 'Decodable'
/// - Identifiable"
///

struct AudioBookItem: Decodable, Identifiable {
    let id: String
    let artistName: String
    let name: String
    let artworkUrl100: String
    let releaseDate: String
    let url: String
}

/// An extension use at UI representing a AudioBookItem item.
/// Conforms to:
/// - FeedDisplayable

extension AudioBookItem: FeedDisplayable {
    var titleText: String { name }
    var subtitleText: String { artistName }
    var artworkUrl: String { artworkUrl100}
    var categoryText: String { "Audio Book" }
    var releaseDateText: String { releaseDate }
    var previewUrlText: String? { nil }
    var storeUrlText: String? { url }
}
