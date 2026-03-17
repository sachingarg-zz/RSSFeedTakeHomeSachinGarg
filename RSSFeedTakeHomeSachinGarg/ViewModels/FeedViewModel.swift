//
//  FeedViewModel.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/16/26.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    private let repository: FeedRepositoryProtocol
    @Published var state: State = .idle
    
    init(repo: FeedRepositoryProtocol) {
        self.repository = repo
    }
    
    func loadData() async {
        state = .loading
        
        do {
            let feedItems = try await repository.fetchFeed()
            state = feedItems.isEmpty ? .empty : .success(feedItems)
            
        } catch {
            if let savedFeed = try? repository.getSavedFeed(),
               !savedFeed.isEmpty {
                state = .success(savedFeed)
            } else {
                state = .error(error.localizedDescription)
            }
        }
    }
}

enum State: Equatable {
    case idle
    case loading
    case success([FeedItem])
    case empty
    case error(String)
}
