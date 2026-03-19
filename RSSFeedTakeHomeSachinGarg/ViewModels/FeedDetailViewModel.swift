//
//  FeedDetailViewModel.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import Foundation
import Combine

@MainActor
class FeedDetailViewModel<T: FeedModelProtocol>: ObservableObject {
    @Published var feedItems: [T] = []
    @Published var searchedItems: [T] = []
    @Published var searchText = ""
    @Published var title: String = ""
    @Published var error: AppError?
    @Published var isLoading = false
    
    private var cancellables : Set<AnyCancellable> = []
    
    let networkService: APIServiceProtocol
    let url: URL
    
    init(url: URL, service: APIServiceProtocol = APIService()) {
        self.url = url
        self.networkService = service
        setupSearch()
    }
    
    func loadFeed() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let response: FeedResponse<T> = try await networkService.fetch(from: url)
            self.feedItems = response.feed.results
            self.title = response.feed.title
            self.searchedItems = self.feedItems
            self.error = nil
        } catch let appError as AppError {
            self.error = appError
        } catch {
            self.error = .unknown
        }
    }
    
    private func setupSearch() {
        $searchText
            .debounce(for: .milliseconds(200), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                guard let self = self else { return }
                if text.isEmpty || text.count < 3 {
                    self.searchedItems = self.feedItems
                } else {
                    self.searchedItems = self.feedItems.filter ({
                        $0.titleText.lowercased().contains(text.lowercased()) ||
                        $0.subtitleText.lowercased().contains(text.lowercased()) ||
                        $0.categoryText.lowercased().contains(text.lowercased())
                    })
                }
            }
            .store(in: &cancellables)
        
    }
}

