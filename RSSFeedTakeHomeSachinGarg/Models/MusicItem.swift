//
//  Untitled.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import Foundation

struct MusicItem: Decodable, Identifiable {
    let id: String
    let artistName: String
    let name: String
    let artworkUrl100: String
    let releaseDate: String
    let kind: String
}

extension MusicItem: FeedDisplayable {
    var releaseDateText: String { releaseDate }
    var categoryText: String { kind }
    var artistDisplayName: String { artistName }
    var titleText: String { name }
    var image: String { artworkUrl100 }
}
