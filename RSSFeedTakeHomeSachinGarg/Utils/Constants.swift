//
//  Constant.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/26/26.
//

import Foundation

enum Constants {
    
    // Mark: - Feed Limits
    enum Limits {
        static let options = [10, 20, 30]
    }
    
    // Mark: - UI Text
    enum Texts {
        // FeedLandingScreen constant
        static let appTitle             = "Apple RSS Feed"
        static let selectFeedLimit      = "Select Limit"
        static let itemsPerFeed         = "Items Per Feed"
        
        // FeedListViewScreen constant
        static let loading              = "Loading..."
        static let searchPrompt         = "Search..."
        
        // FeedDetailViewScreen constant
        static let category             = "Category"
        static let releaseDate          = "Release Date"
        static let playReview           = "Play Review"
        static let openInStore          = "Open in Store"

        // ErrorBannerView constant
        static let retry                = "Retry"
        static let playPreview          = "Play Preview"
    }
    
    // Mark: - System Images
    enum Icons {
        static let fallBackImage    = "photo"
        static let play             =  "play.circle.fill"
        static let open             = "arrow.up.forward.app"
    }
    
    // Mark: - Feed Icons
    enum FeedIcons {
        static let books        = "book.fill"
        static let apps         = "app.fill"
        static let podcasts     = "mic.fill"
        static let audioBooks   = "headphones"
        static let albums       = "music.note.list"
    }
    
    // Mark: RSS Feed Base URLs
    enum RSSBaseURL {
        static let books        = "https://rss.marketingtools.apple.com/api/v2/us/books/top-free"
        static let apps         = "https://rss.marketingtools.apple.cm/api/v2/us/apps/top-free"
        static let podcasts     = "https://rss.marketingtools.apple.com/api/v2/us/podcasts/top"
        static let audioBooks   = "https://rss.marketingtools.apple.com/api/v2/us/audio-books/top"
        static let albums       = "https://rss.marketingtools.apple.com/api/v2/us/music/most-played"
    }
    
    // Mark: Feed Endpoints
    enum EndPoints {
        static let books        = "books"
        static let apps         = "apps"
        static let podcasts     = "podcasts"
        static let audioBooks   = "audio-books"
        static let albums       = "albums"
    }
    
    // Mark: Errors
    enum Errors {
        static let invalidUrl        = "URL provided is invalid."
        static let networkError      = "Network connection failed"
        static let decodingEror      = "Failed to Decode the response."
        static let unknownError      = "Something went wrong, please try again."
        static let nodata            = "No Data Found."
        static let invalidStatusCode = "Server returned the status Code."


    }
    
    // Mark: UI component Accessibility Identifier
    enum AccessibiltyIdentifier {
        // FeedLandingScreen Constant
        static let limitPicker          = "LimitPicker"
        static let feedCard             = "FeedCard_"
        
        // FeedDetailViewScreen Constant
        static let detailTitle          = "Detail_Title"
        static let subTitle             = "Sub_Title"
        static let category             = "Category"
        static let releaseDate          = "Release_date"
        static let playPreview          = "Play_Preview"
        static let detailOpenStore      = "Detail_OpenStore"
    }
   
}
