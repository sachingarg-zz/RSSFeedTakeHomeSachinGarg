//
//  FeedRow.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

import SwiftUI

struct FeedRow<T: FeedModelProtocol>: View {
    let feed: T
    @State private var animate = false
    var body: some View {
        HStack {
            SafeAsyncImage(urlString: feed.artworkUrl, size: CGSize(width: 60, height: 60))
                .shadow(radius: 4)
                .scaleEffect(animate ? 1.04 : 1.0)
                .animation(.spring(duration: 0.55), value: animate)
                .onAppear {
                    animate = true
                }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(feed.titleText).font(.headline)
                Text(feed.subtitleText).font(.caption)
                    .foregroundStyle(.secondary)
                
            }
        }
    }
}

#Preview {
    FeedRow(feed: MusicItem(id: "1", artistName: "artist", name: "name", artworkUrl100: "url", releaseDate: "2026-03-03", url: "", genres: [Genre(name: "name")]))
}
