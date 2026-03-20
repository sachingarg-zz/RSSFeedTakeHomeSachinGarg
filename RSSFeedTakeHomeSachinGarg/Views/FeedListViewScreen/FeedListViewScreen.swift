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
                    
                    Text("Loading...")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(.systemBackground))
            }
            else if let error = viewModel.error {
                errorView(error: error)
            } else {
                    listView
            }
        }
        .navigationTitle(viewModel.title)
        .task {
            await viewModel.loadFeed()
        }
        .searchable(text: $viewModel.searchText, prompt: "Search...")
        
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
    }
    
    @ViewBuilder
    private func errorView(error: AppError) -> some View {
        VStack(spacing: 12.0) {
            Text(error.localizedDescription)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red.opacity(0.8))
                .cornerRadius(8)
            
            Button("Retry") {
                Task {
                    await viewModel.loadFeed()
                }
            }
            .padding(.top, 5)
        }
        .padding()
    }
}

#Preview {
    FeedListViewScreen<MusicItem>(url: FeedType.music.urlString(limit: 10))
}
