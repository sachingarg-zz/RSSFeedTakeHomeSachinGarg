//
//  FeedRepository.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/16/26.
//

import Foundation

protocol FeedRepositoryProtocol {
    func fetchFeed() async throws -> [FeedItem]
    func getSavedFeed() throws -> [FeedItem]
}

class FeedRepository: FeedRepositoryProtocol {
    private let client: FeedClient
    private let parser: FeedParser
    private let feedUrl: URL
    private let cache: CacheFeedFile
    
    init(client: FeedClient, parser: FeedParser, feedUrl: URL, cache: CacheFeedFile ) {
        self.client = client
        self.parser = parser
        self.feedUrl = feedUrl
        self.cache = cache
    }
    
    func fetchFeed() async throws -> [FeedItem] {
        do {
            let feeds = try await fetchAndSave()
            return feeds
            
        } catch {
            return try getSavedFeed()
        }
    }
    
    func getSavedFeed() throws -> [FeedItem] {
        try cache.loadFromCache()
    }
    
    private func fetchAndSave() async throws ->  [FeedItem] {
        let data = try await client.fetchFeed(from: feedUrl)
        let paresedData = try parser.parseData(data: data)
        let dateFormat = DateFormatter()
        dateFormat.locale = Locale(identifier: "ne_US_POSIX")
        dateFormat.dateFormat = "E, dd MMM yyyy HH:mm:ss Z"
        
        let feeds: [FeedItem] = paresedData.compactMap { feed -> FeedItem? in
            guard let link = URL(string: feed.link.isEmpty ? feed.guid : feed.link) else {
               return nil
            }
            
            let publishDate = dateFormat.date(from: feed.publishDate) ?? Date()
            let imageUrl = URL(string: feed.imageUrl) ?? nil
            
            
            return FeedItem(id: feed.guid, title: feed.title, htmlDescription: feed.description, publishDate: publishDate, imageUrl: imageUrl, linkUrl: link)

        }
        try cache.saveCache(items: feeds)
        return feeds
        
    }
}
