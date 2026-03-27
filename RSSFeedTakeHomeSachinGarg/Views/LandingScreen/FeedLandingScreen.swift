//
//  FeedLandingScreen.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import SwiftUI

/// The app's landing screen where users can select:
/// - RSS feed category (grid UI)
/// - Feed limit (segmented picker: 10, 20, 30)
///
/// The screen uses "Lazy VGrid' for an App-Store style layout.
/// Each feed card navigates to a type-safe generic 'FeedListViewScreen"

struct FeedLandingScreen: View {
    @State private var limit = 10
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
                                                  
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                VStack {
                    Text(Constants.Texts.selectFeedLimit)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Picker("limit", selection: $limit) {
                        ForEach(Constants.Limits.options, id: \.self) { value in
                            Text("\(value)").tag(value)
                        }
                    }
                    .pickerStyle(.segmented)
                    .accessibilityIdentifier(Constants.AccessibiltyIdentifier.limitPicker)
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(FeedType.allCases) { type in
                            NavigationLink {
                                FeedTypeListBuilder.build(for: type, limit: limit)
                            } label: {
                                FeedCard(feed: type)
                                    .accessibilityIdentifier("\(Constants.AccessibiltyIdentifier.feedCard)\(type.rawValue)")
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle(Constants.Texts.appTitle)
        }
    }
}

enum FeedTypeListBuilder {
    @ViewBuilder
    static func build(for feed: FeedType, limit: Int) -> some View {
        switch feed {
        case .music:
            FeedListViewScreen<MusicItem>(url: feed.urlString(limit: limit))
        case .podcasts:
            FeedListViewScreen<PodCastItem>(url: feed.urlString(limit: limit))
        case .apps:
            FeedListViewScreen<AppItem>(url: feed.urlString(limit: limit))
        case .books:
            FeedListViewScreen<BookItem>(url: feed.urlString(limit: limit))
        case .audioBooks:
            FeedListViewScreen<AudioBookItem>(url: feed.urlString(limit: limit))
        }
    }
}

#Preview {
    FeedLandingScreen()
}
