//
//  FeedDetailViewModel.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import Foundation

@MainActor
class FeedDetailViewModel<T: FeedDisplayable & Decodable>: ObservableObject {
    @Published var feedItems: [T] = []
    @Published var title: String = ""
    
    let networkService: APIServiceProtocol
    let url: URL
    
    init(url: URL, service: APIServiceProtocol = APIService()) {
        self.url = url
        self.networkService = service
    }
    
    func loadFeed() async{
        do {
            let response: FeedResponse<T> = try await networkService.fetch(from: url)
            self.feedItems = response.feed.results
            self.title = response.feed.title
        } catch {
            print(error.localizedDescription)
        }
    }
}

