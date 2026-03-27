//
//  ErrorView.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

import SwiftUI

/// A ErrorBannerView Display the error encounter while featching the RSS Feed.
///
/// Responsibilities:
/// - Recieve Error in initializzer
///
/// Function
/// - Retry to fetch the Feed Again

struct ErrorBannerView: View {
    let error: AppError
    let retryAction: (() -> Void)?
    
    init(error: AppError, retryAction: (() -> Void)? = nil) {
        self.error = error
        self.retryAction = retryAction
    }
    var body: some View {
        VStack(spacing: 12.0) {
            Text(error.localizedDescription)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red.opacity(0.8))
                .cornerRadius(8)
            
            Button(Constants.Texts.retry) {
                retryAction?()
            }
        }
    }
}
