//
//  SafeAsyncImage.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

import SwiftUI

/// A safe wrapper around 'AsyncImage that supports optional. URLs.
///
/// If the URL is:
/// - 'nil': Shows placeholder
/// - invalid: Shows fallback icon
/// - loading: Shows 'ProgressView"
///
/// Usage:
/// SafeAsyncImage (urlString: item.artworkUrl, size: .init(width: 200, height; 200))

struct SafeAsyncImage: View {
    let urlString: String?
    let size: CGSize
    
    var body: some View {
        AsyncImage(url: URL(string: urlString ?? "")) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure(_):
                Image(systemName: Constants.Icons.fallBackImage)
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.gray.opacity(0.6 ))
            @unknown default:
                Color.clear
            }
        }
        .frame(width: size.width, height: size.height)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    SafeAsyncImage(urlString: "", size: .zero)
}
