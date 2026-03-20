//
//  FeedCard.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/19/26.
//

import SwiftUI

struct FeedCard: View {
    let feed: FeedType
    var body: some View {
        ZStack {
            LinearGradient(colors: feed.gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack {
                Image(systemName: feed.iconName)
                    .font(.system(size: 36))
                    .foregroundColor(.white)
                
                Text(feed.rawValue)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .frame(height: 130)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 5)
        }
        
    }
}

#Preview {
    FeedCard(feed: FeedType.apps)
}
