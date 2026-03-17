//
//  FeedItem.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/16/26.
//

import Foundation

struct FeedItem: Codable, Identifiable, Equatable, Hashable {
    let id, title, htmlDescription: String
    let publishDate: Date
    let imageUrl: URL?
    let linkUrl: URL
    
    enum CodingKeys: String, CodingKey {
        case linkUrl = "link"
        case htmlDescription = "summaryHTML"
        case publishDate = "pubDate"
        case imageUrl = "imageURL"
        case id = "id"
        case title = "title"
    }
}
