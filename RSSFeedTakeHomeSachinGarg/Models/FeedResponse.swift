//
//  FeedResponse.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import Foundation

struct FeedResponse<T: Decodable>: Decodable {
    let feed: Feed<T>
}

struct Feed<T: Decodable>: Decodable {
    let title: String
    let id: String
    let results: [T]
}
