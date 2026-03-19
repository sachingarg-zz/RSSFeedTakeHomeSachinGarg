//
//  PodCastItem.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

struct PodCastItem: Decodable, Identifiable {
    let id: String
    let artistName: String
    let name: String
    let artworkUrl100: String
    let url: String
   let genres: [Genre]
}

extension PodCastItem: FeedDisplayable {
    var titleText: String { name }
    var subtitleText: String { artistName }
    var artworkUrl: String { artworkUrl100 }
    var categoryText: String {  genres.first?.name ?? "Podcast" }
    var releaseDateText: String { "Explicit" }
    var previewUrlText: String? { nil }
    var storeUrlText: String? { url }
}
