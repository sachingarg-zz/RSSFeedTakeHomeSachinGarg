//
//  AppItem 2.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

/// A model representing a Book item returned from Apple RSS feed.
///
/// Example JSON:
/// "id": "123"
/// "name": "Sample  Book"
/// "artistName": "Author"
/// "releaseDate": "2024-01-01"
/// "url": "www.apple.com/feed/ultra.pnc"
///
/// Conforms to:
/// - 'Decodable'
/// - Identifiable"
///

struct BookItem: Decodable, Identifiable {
    let id: String
    let artistName: String
    let name: String
    let artworkUrl100: String
    let releaseDate: String
    let kind: String
    let url: String
}

/// An extension use at UI representing a book item r.
/// Conforms to:
/// - FeedDisplayable

extension  BookItem: FeedDisplayable {
    var titleText: String { name }
    var subtitleText: String { artistName }
    var artworkUrl: String { artworkUrl100}
    var categoryText: String { kind }
    var releaseDateText: String { releaseDate }
    var previewUrlText: String? { nil }
    var storeUrlText: String? { url }
}
