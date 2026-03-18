//
//  FeedDetailScreen.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import SwiftUI

struct FeedDetailScreen<T: FeedModelProtocol>: View {
    @StateObject private var viewModel: FeedDetailViewModel<T>
    
    init(url: URL) {
        _viewModel = StateObject(wrappedValue: FeedDetailViewModel(url: url))
    }
    var body: some View {
        List(viewModel.feedItems) { feed in
            NavigationLink {
                FeedItemDetailScreen(feed: feed)
            } label: {
                HStack {
                    AsyncImage(url: URL(string: feed.image)) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 8.0))
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(feed.titleText).font(.headline)
                        Text(feed.artistDisplayName).font(.caption)
                            .foregroundStyle(.secondary)
                        
                    }
                }

            }

        }
        .navigationTitle(viewModel.title)
        .task {
            await viewModel.loadFeed()
        }
        
    }
}

#Preview {
    //  FeedDetailScreen()
}
