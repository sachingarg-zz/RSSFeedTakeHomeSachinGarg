//
//  RSSFeedCache.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/16/26.
//

import Foundation

class CacheFeedFile {
    private let fileUrl: URL = {
        let repo = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return repo.appendingPathExtension("feedCache.json")
    } ()
    
    func saveCache(items: [FeedItem]) throws {
        let data = try JSONEncoder().encode(items)
        try data.write(to: fileUrl, options: .atomic)
    }
    
    func loadFromCache() throws -> [FeedItem] {
        let data = try Data(contentsOf: fileUrl)
        return try JSONDecoder().decode([FeedItem].self, from: data)
    }
}
