//
//  FeedLandingScreen.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import SwiftUI

struct FeedLandingScreen: View {
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
            FeedListViewScreen<MusicItem>(url: feed.url)
        case .podcasts:
            FeedListViewScreen<PodCastItem>(url: feed.url)
        case .apps:
            FeedListViewScreen<AppItem>(url: feed.url)
        case .books:
            FeedListViewScreen<BookItem>(url: feed.url)
        }
    }
}

#Preview {
    FeedLandingScreen()
}
