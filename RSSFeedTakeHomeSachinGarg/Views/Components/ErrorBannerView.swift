//
//  ErrorView.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

import SwiftUI

//This could be if need gloabal or reusable component
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
            
            Button("Retry") {
                retryAction?()
            }
        }
        
        
    }
}
