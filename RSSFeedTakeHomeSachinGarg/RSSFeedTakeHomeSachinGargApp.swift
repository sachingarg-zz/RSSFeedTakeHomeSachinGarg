//
//  RSSFeedTakeHomeSachinGargApp.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/16/26.
//

import SwiftUI

@main
struct RSSFeedTakeHomeSachinGargApp: App {
    var body: some Scene {
        WindowGroup {
            let repository = FeedRepository(client: FeedClient(), parser: FeedParser(), feedUrl: URL(string: "https://www.apple.com/newsroom/rss-feed.rss")!, cache: CacheFeedFile())
            FeedListView(feedListViewModel: FeedViewModel(repo: repository))
        }
    }
}
