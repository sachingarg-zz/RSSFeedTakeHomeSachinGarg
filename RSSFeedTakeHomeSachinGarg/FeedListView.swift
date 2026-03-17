//
//  FeedListView.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/16/26.
//

import SwiftUI

//struct RSSFeedModel {
//    let imageUrl: String?
//    let guid: String
//    let link: URL
//    let publishDate: String
//    let htmlDescription: String
//}


struct FeedListView: View {
    //let url = URL(string: "https://www.apple.com/newsroom/rss-feed.rss")!
//    let repository = FeedRepository(client: FeedClient(), parser: FeedParser(), feedUrl: URL(string: "https://www.apple.com/newsroom/rss-feed.rss")!, cache: CacheFeedFile())
   
    @StateObject var feedListViewModel: FeedViewModel
    
    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Apple RSS Feed")
                .task {
                    await feedListViewModel.loadData()
                }
        }
    }
    
    @ViewBuilder private var content: some View {
        switch feedListViewModel.state {
        case .idle, .loading:
            ProgressView("Loading....")
        case .empty:
            EmptyView()
        case .error(_) :
            EmptyView()
        case .success(let feeds):
            List(feeds) { feed in
                NavigationLink(value: feed) {
                    HStack (alignment: .top, spacing: 10){
                        if let url = feed.imageUrl {
                            AsyncImage(url: url) { img in
                                img.image?.resizable().scaledToFill()
                            }
                            .frame(width: 60, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 8.0))
                        }
                        VStack(alignment: .leading, spacing: 5.0) {
                            Text(feed.title)
                                .font(.headline)
                            Text(feed.publishDate, style: .date)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            
                        }
                    }
                    
                }
            }
            .navigationDestination(for: FeedItem.self) { item in
                
            }
        }
    }
}

#Preview {
    let repository = FeedRepository(client: FeedClient(), parser: FeedParser(), feedUrl: URL(string: "https://www.apple.com/newsroom/rss-feed.rss")!, cache: CacheFeedFile())
   
    FeedListView(feedListViewModel: FeedViewModel(repo: repository))
}
