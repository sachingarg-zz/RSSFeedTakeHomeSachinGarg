//
//  Untitled.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import Foundation

/// A model representing a Music item returned from Apple RSS feed.
///
/// Example JSON:
/// "id": "123"
/// "name": "Sample Music Album"
/// "artistName": "Author"
/// "releaseDate": "2024-01-01"
/// "url": "www.apple.com/feed/ultra.pnc"
///
/// Conforms to:
/// - 'Decodable'
/// - Identifiable"

struct Genre: Decodable{
    let name: String
}

struct MusicItem: Decodable, Identifiable {
    let id: String
    let artistName: String
    let name: String
    let artworkUrl100: String
    let releaseDate: String
    let url: String
    let genres: [Genre]
}

/// An extension use at UI representing a music item.
/// Conforms to:
/// - FeedDisplayable"

extension MusicItem: FeedDisplayable {
    var titleText: String { name }
    var subtitleText: String { artistName }
    var artworkUrl: String { artworkUrl100 }
    var previewUrlText: String? { nil }
    var storeUrlText: String? { url }
    var releaseDateText: String { releaseDate }
    var categoryText: String { genres.first?.name ?? "Music" }
}
