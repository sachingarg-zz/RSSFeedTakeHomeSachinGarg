//
//  AppItem.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

struct AppItem: Decodable, Identifiable {
    let id: String
    let artistName: String
    let name: String
    let artworkUrl100: String
    let releaseDate: String
    let kind: String
}

extension  AppItem: FeedDisplayable {
    var artistDisplayName: String { artistName }
    var titleText: String { name }
    var image: String { artworkUrl100 }
    var releaseDateText: String { releaseDate }
    var categoryText: String { kind }
}
