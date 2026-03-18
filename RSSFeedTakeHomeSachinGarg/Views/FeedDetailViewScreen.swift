//
//  FeedDetailViewScreen.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import SwiftUI

struct FeedDetailViewScreen<T: FeedModelProtocol>: View {
    let feed: T
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                AsyncImage(url: URL(string: feed.image)) { img in
                    img.resizable().scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                .cornerRadius(10)
                .shadow(radius: 5)
                
                //Title
                Text(feed.titleText)
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                //Artist
                Text(feed.artistDisplayName)
                    .font(.title3)
                    .foregroundStyle(.secondary)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Text("Release Date:")
                            .font(.headline)
                        Spacer()
                        Text(feed.releaseDateText)
                    }
                    
                    HStack {
                        Text("Category:")
                            .font(.headline)
                        Spacer()
                        Text(feed.categoryText)
                    }
                    
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                Spacer()
                                
            }
            .padding()
        }
        .navigationTitle(feed.titleText)
        .navigationBarTitleDisplayMode(.inline)
    }
}

