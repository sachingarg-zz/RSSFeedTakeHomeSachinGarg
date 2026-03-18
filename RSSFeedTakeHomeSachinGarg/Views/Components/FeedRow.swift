//
//  FeedRow.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

import SwiftUI

struct FeedRow<T: FeedModelProtocol>: View {
    let feed: T
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: feed.image)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 8.0))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(feed.titleText).font(.headline)
                Text(feed.artistDisplayName).font(.caption)
                    .foregroundStyle(.secondary)
                
            }
        }
    }
}

#Preview {
    FeedRow(feed: MusicItem(id: "1", artistName: "artistName", name: "name", artworkUrl100: "artwork", releaseDate: "2026-09-09", kind: "Test"))
}
