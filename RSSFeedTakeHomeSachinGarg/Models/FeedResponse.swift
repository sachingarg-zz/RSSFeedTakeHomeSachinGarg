//
//  FeedResponse.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import Foundation

///A generic ViewModel used to load and manage items for any Apple RSS feed.

struct FeedResponse<T: Decodable>: Decodable {
    let feed: Feed<T>
}

struct Feed<T: Decodable>: Decodable {
    let title: String
    let id: String
    let results: [T]
}
