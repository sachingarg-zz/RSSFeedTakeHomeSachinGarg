//
//  FeedResponse.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import Foundation

///A generic ViewModel used to load and manage items for any Apple RSS feed.
///
/// Type Constraints:
/// - "T: Decodable' (must be decodable from JSON)
/// - "T: FeedDisplaxable' (must provide Ul-friendly propertiès)
/// Responsibilities:
/// - Load RSS feed from API using async/await
/// - Track loading & error states for Ul binding
/// - Maintain original items and search-filtered results
/// - Debounce search input with Combine
///
///  Published Properties:
/// - "items: Raw feed results
/// - filteredItems: Filtered results via search
/// - searchText: User search input
/// - istoading: Tracks API activity
/// - 'error: Contains AppErtor if something fails
///
/// Lifecycle:
///  - Ensures feed loads only once using 'isLeaded' flag

struct FeedResponse<T: Decodable>: Decodable {
    let feed: Feed<T>
}

struct Feed<T: Decodable>: Decodable {
    let title: String
    let id: String
    let results: [T]
}
