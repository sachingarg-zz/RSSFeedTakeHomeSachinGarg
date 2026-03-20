//
//  ModelTypeProtocols.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import Foundation

typealias  FeedModelProtocol = Decodable & Identifiable & FeedDisplayable

/// A unified interface for any RSS feed result item./// A unified interface for conforming to this protocol can be displayed in:
/// - Feed list screen
/// - Detail screen
///
/// Required properties include:
/// - titleText'
/// - subtitle Text'
/// - artworkUrl
/// -categoryText'
/// - releaseDateText
///
/// This enables generic UI:

protocol FeedDisplayable {
    var id: String { get }
    var titleText: String { get }
    var subtitleText: String { get }
    var artworkUrl: String { get }
    var categoryText: String { get }
    var releaseDateText: String { get }
    var previewUrlText: String? { get }
    var storeUrlText: String? { get }
}
