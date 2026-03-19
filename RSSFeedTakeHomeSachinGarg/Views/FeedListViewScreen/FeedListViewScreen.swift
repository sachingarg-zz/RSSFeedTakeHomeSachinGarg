//
//  FeedListViewScreen.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import SwiftUI

struct FeedListViewScreen<T: FeedModelProtocol>: View {
    @StateObject private var viewModel: FeedDetailViewModel<T>
    
    init(url: URL) {
        _viewModel = StateObject(wrappedValue: FeedDetailViewModel(url: url))
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
    FeedListViewScreen<MusicItem>(url: FeedType.music.url(limit: 10))
}
