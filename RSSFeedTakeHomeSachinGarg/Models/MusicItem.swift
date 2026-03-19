//
//  Untitled.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import Foundation

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

extension MusicItem: FeedDisplayable {
    var titleText: String { name }
    var subtitleText: String { artistName }
    var artworkUrl: String { artworkUrl100 }
    var previewUrlText: String? { nil }
    var storeUrlText: String? { url }
    var releaseDateText: String { releaseDate }
    var categoryText: String { genres.first?.name ?? "Music" }
}
