//
//  AppItem 2.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//


struct BookItem: Decodable, Identifiable {
    let id: String
    let artistName: String
    let name: String
    let artworkUrl100: String
    let releaseDate: String
    let kind: String
    let url: String
}

extension  BookItem: FeedDisplayable {
    var titleText: String { name }
    var subtitleText: String { artistName }
    var artworkUrl: String { artworkUrl100}
    var categoryText: String { kind }
    var releaseDateText: String { releaseDate }
    var previewUrlText: String? { nil }
    var storeUrlText: String? { url }
}
