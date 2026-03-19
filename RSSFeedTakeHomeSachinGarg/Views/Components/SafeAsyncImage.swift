//
//  SafeAsyncImage.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

import SwiftUI

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
                Image(systemName: "photo")
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
