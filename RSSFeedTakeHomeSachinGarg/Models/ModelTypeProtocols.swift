//
//  ModelTypeProtocols.swift
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
    
    // New optioanl type feature properties
//    var appStoreUrl: String? { get }
//    var previewUrl: String? { get }
}
