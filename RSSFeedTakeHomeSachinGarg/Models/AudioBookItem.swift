//
//  AudioBookItem.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

import Foundation

struct AudioBookItem: Decodable, Identifiable {
    let id: String
    let artistName: String
    let name: String
    let artworkUrl100: String
    let releaseDate: String
    let url: String
}

extension AudioBookItem: FeedDisplayable {
    var titleText: String { name }
    var subtitleText: String { artistName }
    var artworkUrl: String { artworkUrl100}
    var categoryText: String { "Audio Book" }
    var releaseDateText: String { releaseDate }
    var previewUrlText: String? { nil }
    var storeUrlText: String? { url }
}
