//
//  FeedDetailViewModel.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import Foundation
import Combine

/// A generic view model to load and manage items from an Apple RSS feed.
///
/// - Note: This view model works for **any** type that conforms to:
///
/// - 'Decodable'
///
/// - "FeedDisplayable:
/// - Parameters:
/// - url: The RSS feed URL.
/// - service: An object conforming to "APIServiceProtocol, injected for testing.
///
/// Example:
///
/// let vm = FeedDetailViewModel<BookItem> (url. feed.url)
/// await vm.load ()


@MainActor
class FeedDetailViewModel<T: FeedModelProtocol>: ObservableObject {
    @Published var feedItems: [T] = []
    @Published var searchedItems: [T] = []
    @Published var searchText = ""
    @Published var title: String = ""
    @Published var error: AppError?
    @Published var isLoading = false
    @Published var isLoaded = false

    
    private var cancellables : Set<AnyCancellable> = []
    
    let networkService: APIServiceProtocol
    let urlString: String
    
    init(urlString: String, service: APIServiceProtocol = APIService()) {
        self.urlString = urlString
        self.networkService = service
        setupSearch()
    }
    
/// Loads data from the RSS feed and updates the UI state.
///
/// This method:
/// - Fetches data asynchronously using 'APIService"
/// - Maps errors to AppError
/// - Applies initial filtering state
///
///- Returns: Nothing (updates @Published properties)
/// - Throws: Never (errors are mapped to UI state)
///
/// Call from Swiftul using:
///
    
    func loadFeed() async {
        guard !isLoaded else { return }
        isLoaded = true
        isLoading = true
        defer { isLoading = false }
        
        do {
            let response: FeedResponse<T> = try await networkService.fetch(from: self.urlString)
            self.feedItems = response.feed.results
            self.title = response.feed.title
            self.searchedItems = self.feedItems
            self.error = nil
        } catch let appError as AppError {
            self.error = appError
        } catch let error {
            self.error = AppError.unknown(error)
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

