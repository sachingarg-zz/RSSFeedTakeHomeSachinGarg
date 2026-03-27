//
//  FeedListViewScreen.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import SwiftUI

/// Displays a list of RSS feed items with search and navigation.
///
/// This view:
/// - Fetches items via FeedDetailViewModel
/// - Supports live search using
/// searchable () *
/// - Navigates to FeedItemDetailScreen
///
/// - Note: Generic over any 'FeedDisplayable' type.

struct FeedListViewScreen<T: FeedModelProtocol>: View {
    @StateObject private var viewModel: FeedDetailViewModel<T>
    
    init(url: String) {
        _viewModel = StateObject(wrappedValue: FeedDetailViewModel(urlString: url))
    }
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                VStack(spacing: 20) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                    
                    Text(Constants.Texts.loading)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(.systemBackground))
            }
            else if let error = viewModel.error {
                ErrorBannerView(error: error) {
                    Task {
                        viewModel.isLoaded = false
                        await viewModel.loadFeed()
                    }
                }
            } else {
                    listView
            }
        }
        .navigationTitle(viewModel.title)
        .task {
            await viewModel.loadFeed()
        }
        .searchable(text: $viewModel.searchText, prompt: Constants.Texts.searchPrompt)
        
    }
    
    @ViewBuilder
    private var listView: some View {
        List(viewModel.searchedItems) { feed in
            NavigationLink {
                FeedDetailViewScreen(feed: feed)
            } label: {
                FeedRow(feed: feed)
            }
        }
        .accessibilityIdentifier("FeedList)")

    }
}

#Preview {
    FeedListViewScreen<MusicItem>(url: FeedType.music.urlString(limit: 10))
}
