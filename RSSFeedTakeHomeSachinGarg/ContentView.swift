//
//  ContentView.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/16/26.
//

import SwiftUI

struct ContentView: View {
    let repository = FeedRepository(client: FeedClient(), parser: FeedParser(), feedUrl: URL(string: "https://www.apple.com/newsroom/rss-feed.rss")!, cache: CacheFeedFile())
    
    var body: some View {
        FeedListView(feedListViewModel: FeedViewModel(repo: repository))
    }
}

#Preview {
    ContentView()
}
