//
//  FeedLandingScreen.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import SwiftUI

struct FeedLandingScreen: View {
    @State private var limit = 10
    private let limits = [10, 20, 30]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
                                                  
    var body: some View {
        NavigationStack {
        VStack(spacing: 20) {
            Picker("Linit", selection: $limit) {
                ForEach(limits, id: \.self) { value in
                    Text("\(value)").tag(value)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(FeedType.allCases) { type in
                        NavigationLink {
                            FeedTypeListBuilder.build(for: type, limit: limit)
                        } label: {
                            FeedCard(feed: type)
                        }
                    }
                }
            }
        }
        .navigationTitle("Select Feed")
    }
    }
}

enum FeedTypeListBuilder {
    @ViewBuilder
    static func build(for feed: FeedType, limit: Int) -> some View {
        switch feed {
        case .music:
            FeedListViewScreen<MusicItem>(url: feed.url(limit: limit))
        case .podcasts:
            FeedListViewScreen<PodCastItem>(url: feed.url(limit: limit))
        case .apps:
            FeedListViewScreen<AppItem>(url: feed.url(limit: limit))
        case .books:
            FeedListViewScreen<BookItem>(url: feed.url(limit: limit))
        case .audioBooks:
            FeedListViewScreen<AudioBookItem>(url: feed.url(limit: limit))
        }
    }
}

#Preview {
    FeedLandingScreen()
}
