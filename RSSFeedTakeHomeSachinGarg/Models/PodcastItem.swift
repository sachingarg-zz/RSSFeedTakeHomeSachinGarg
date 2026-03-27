//
//  PodCastItem.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

/// A model representing a Podcast item returned from Apple RSS feed.
///
/// Example JSON:
/// "id": "123"
/// "name": "Sample Podcast"
/// "artistName": "Author"
/// "releaseDate": "2024-01-01"
/// "url": "www.apple.com/feed/ultra.pnc"
///
/// Conforms to:
/// - 'Decodable'
/// - Identifiable"

struct PodCastItem: Decodable, Identifiable {
    let id: String
    let artistName: String
    let name: String
    let artworkUrl100: String
    let url: String
   let genres: [Genre]
}

/// An extension use at UI representing a Podcast item.
/// Conforms to:
/// - FeedDisplayable

extension PodCastItem: FeedDisplayable {
    var titleText: String { name }
    var subtitleText: String { artistName }
    var artworkUrl: String { artworkUrl100 }
    var categoryText: String {  genres.first?.name ?? "Podcast" }
    var releaseDateText: String { "Explicit" }
    var previewUrlText: String? { nil }
    var storeUrlText: String? { url }
}
