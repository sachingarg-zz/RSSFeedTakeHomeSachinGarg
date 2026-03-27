//
//  FeedDetailViewScreen.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/17/26.
//

import SwiftUI
import AVFoundation

/// Shows detailed information about a selected RSS item.
///
/// Includes:
/// - Artwork image
/// - Title, subtitle
/// - Category
/// - Release date
/// - Optional preview button
/// - Optional App Store link
///
/// Works with any type conforming to FeedDisplayable

struct FeedDetailViewScreen<T: FeedModelProtocol>: View {
    let feed: T
    @State private var animate = false
    @State private var player: AVPlayer?
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                imageView()
                
                VStack {
                    //Title
                    Text(feed.titleText)
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .accessibilityIdentifier(Constants.AccessibiltyIdentifier.detailTitle)

                    
                    //Artist
                    Text(feed.subtitleText)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                        .accessibilityIdentifier(Constants.AccessibiltyIdentifier.subTitle)

                }
                
                VStack(spacing: 14) {
                    infoRow(label: Constants.Texts.category, value: feed.categoryText)
                        .accessibilityIdentifier(Constants.AccessibiltyIdentifier.category)

                    infoRow(label: Constants.Texts.releaseDate, value: feed.releaseDateText)
                        .accessibilityIdentifier(Constants.AccessibiltyIdentifier.releaseDate)

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
                        Label(Constants.Texts.playReview, systemImage: Constants.Icons.play)
                            .font(.title3.bold())
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .padding(.horizontal)
                    .accessibilityIdentifier(Constants.AccessibiltyIdentifier.playPreview)
                }
                
                // Store Url
                if let storeURl = feed.storeUrlText,
                   let url = URL(string: storeURl) {
                    Link(destination: url) {
                        Label(Constants.Texts.openInStore, systemImage: Constants.Icons.open)
                            .font(.title3.bold())
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .padding(.horizontal)
                    .accessibilityIdentifier(Constants.AccessibiltyIdentifier.detailOpenStore)

                }

            }
            .padding(.top)
        }
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            cleanup()
        }
    }
    
    private func cleanup() {
        player?.pause()
        player?.replaceCurrentItem(with: nil)
        player = nil
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
    
    @ViewBuilder
    private func imageView() -> some View {
        SafeAsyncImage(urlString: feed.artworkUrl, size: CGSize(width: 200, height: 200))
            .shadow(radius: 8)
            .scaleEffect(animate ? 1.04 : 1.0)
            .animation(.spring(duration: 0.55), value: animate)
            .onAppear {
                animate = true
            }
    }
}

