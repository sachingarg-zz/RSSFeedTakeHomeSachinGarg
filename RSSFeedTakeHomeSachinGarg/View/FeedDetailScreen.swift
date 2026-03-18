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
        VStack {
            if let error = viewModel.error {
                errorView(error: error)
            }
            
            List(viewModel.feedItems) { feed in
                NavigationLink {
                    FeedItemDetailScreen(feed: feed)
                } label: {
                    FeedRow(feed: feed)
                }
            }
            .navigationTitle(viewModel.title)
            .task {
                await viewModel.loadFeed()
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
    //  FeedDetailScreen()
}
