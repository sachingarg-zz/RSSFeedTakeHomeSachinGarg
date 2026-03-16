//
//  FeedListView.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/16/26.
//

import SwiftUI

class FeedListViewViewModel: ObservableObject {
    
}
struct FeedListView: View {
    
    @StateObject private var feedListViewModel = FeedListViewViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FeedListView()
}
