//
//  Untitled.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import Foundation

typealias  FeedModelProtocol = Decodable & Identifiable & FeedDisplayable
protocol FeedDisplayable {
    var titleText: String { get }
    var artistDisplayName: String { get }
    var image: String { get }
    var releaseDateText: String { get }
    var categoryText: String { get }
}

struct Music: Decodable, Identifiable {
    let id: String
    let artistName: String
    let name: String
    let artworkUrl100: String
    let releaseDate: String
    let kind: String
}

extension Music: FeedDisplayable {
    var releaseDateText: String { releaseDate }
    var categoryText: String { kind }
    var artistDisplayName: String { artistName }
    var titleText: String { name }
    var image: String { artworkUrl100 }
}

struct PodCast: Decodable, Identifiable {
    let id: String
    let artistName: String
    let name: String
    let artworkUrl100: String
    let releaseDate: String
    let kind: String
}

extension  PodCast: FeedDisplayable {
    var artistDisplayName: String { artistName }
    var titleText: String { name }
    var image: String { artworkUrl100 }
    var releaseDateText: String { releaseDate }
    var categoryText: String { kind }
}

struct AppItem: Decodable, Identifiable {
    let id: String
    let artistName: String
    let name: String
    let artworkUrl100: String
    let releaseDate: String
    let kind: String
}

extension  AppItem: FeedDisplayable {
    var artistDisplayName: String { artistName }
    var titleText: String { name }
    var image: String { artworkUrl100 }
    var releaseDateText: String { releaseDate }
    var categoryText: String { kind }
}


struct BookItem: Decodable, Identifiable {
    let id: String
    let artistName: String
    let name: String
    let artworkUrl100: String
    let releaseDate: String
    let kind: String
}

extension  BookItem: FeedDisplayable {
    var artistDisplayName: String { artistName }
    var titleText: String { name }
    var image: String { artworkUrl100 }
    var releaseDateText: String { releaseDate }
    var categoryText: String { kind }
}
