//
//  FeedDetailViewScreen.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import SwiftUI
import AVFoundation

struct FeedDetailViewScreen<T: FeedModelProtocol>: View {
    let feed: T
    @State private var animate = false
    @State private var player: AVPlayer?
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                SafeAsyncImage(urlString: feed.artworkUrl, size: CGSize(width: 200, height: 200))
                    .shadow(radius: 8)
                    .scaleEffect(animate ? 1.04 : 1.0)
                    .animation(.spring(duration: 0.55), value: animate)
                    .onAppear {
                        animate = true
                    }
                
                VStack {
                    //Title
                    Text(feed.titleText)
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .accessibilityIdentifier("Detail_Title")

                    
                    //Artist
                    Text(feed.subtitleText)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                        .accessibilityIdentifier("Sub_Title")

                }
                
                VStack(spacing: 14) {
                    infoRow(label: "Category", value: feed.categoryText)
                        .accessibilityIdentifier("Category")

                    infoRow(label: "Release Date", value: feed.releaseDateText)
                        .accessibilityIdentifier("Release_date")

                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding(.horizontal)
                
                if let preview = feed.previewUrlText,
                   let url = URL(string: preview) {
                    Button {
                        player = AVPlayer(url: url)
                        player?.play()
                    } label: {
                        Label("Play Review", systemImage: "play.circle.fill")
                            .font(.title3.bold())
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .padding(.horizontal)
                    .accessibilityIdentifier("Play_Preview")


                }
                
                // Store Url
                if let storeURl = feed.storeUrlText,
                   let url = URL(string: storeURl) {
                    Link(destination: url) {
                        Label("Open in Store", systemImage: "arrow.up.forward.app")
                            .font(.title3.bold())
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .padding(.horizontal)
                    .accessibilityIdentifier("Detail_OpenStore")

                }

            }
            .padding(.top)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    private func infoRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .font(.headline)
            
            Spacer()
            
            Text(value)
                .foregroundColor(.secondary)
        }
    }
}

