//
//  Untitled.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import Foundation

/// A model representing a book item returned from Apple RSS feed.
///
/// Example JSON:
/// "id": "123"
/// "name": "Sample Book", II1 "artistName": "Author"
/// "releaseDate": "2024-01-01"
/// }
///
/// Conforms to:
/// - 'Decodable'
///- Identifiable"
/// - FeedDisplayable"

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
    //let kind: String
}

/// A model representing a book item returned from Apple RSS feed.
///
/// Example JSON:
/// "id": "123"
/// "name": "Sample Book", II1 "artistName": "Author"
/// "releaseDate": "2024-01-01"
/// }
///
/// Conforms to:
/// - 'Decodable'
///- Identifiable"
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
