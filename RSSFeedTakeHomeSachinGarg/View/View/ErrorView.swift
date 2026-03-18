//
//  ErrorView.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/18/26.
//

import SwiftUI

//This could ne if need gloabal or reusable component
struct ErrorView: View {
    let error: AppError
    
    init(error: AppError) {
        self.error = error
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
                
            } 
        }
        
        
    }
}
