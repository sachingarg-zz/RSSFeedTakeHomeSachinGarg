//
//  FeedDetailViewModel.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import Foundation

@MainActor
class FeedDetailViewModel<T: FeedModelProtocol>: ObservableObject {
    @Published var feedItems: [T] = []
    @Published var title: String = ""
    @Published var error: AppError?
    @Published var isLoading = false
    
    let networkService: APIServiceProtocol
    let url: URL
    
    init(url: URL, service: APIServiceProtocol = APIService()) {
        self.url = url
        self.networkService = service
    }
    
    func loadFeed() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let response: FeedResponse<T> = try await networkService.fetch(from: url)
            self.feedItems = response.feed.results
            self.title = response.feed.title
            self.error = nil
        } catch let appError as AppError {
            self.error = appError
        } catch {
            self.error = .unknown
        }
    }
}

