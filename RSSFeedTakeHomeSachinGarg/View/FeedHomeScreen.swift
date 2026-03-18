//
//  FeedHomeScreen.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import SwiftUI

struct FeedHomeScreen: View {
    var body: some View {
        NavigationStack {
            Section("Categories") {
                List(FeedType.allCases) { feed in
                    NavigationLink {
                        FeedTypeListBuilder.build(for: feed)
                    } label: {
                        Label(feed.rawValue, systemImage: feed.iconName)
                            .foregroundColor(.blue)
                    }
                }
            }
        .navigationTitle("Top RSS Feed Category")
        }
    }
}

enum FeedTypeListBuilder {
    @ViewBuilder
    static func build(for feed: FeedType) -> some View {
        switch feed {
        case .music:
            FeedDetailScreen<Music>(url: feed.url)
        case .podcasts:
            FeedDetailScreen<PodCast>(url: feed.url)
        case .apps:
            FeedDetailScreen<AppItem>(url: feed.url)
        case .books:
            FeedDetailScreen<BookItem>(url: feed.url)
        }
    }
}

#Preview {
    FeedHomeScreen()
}
