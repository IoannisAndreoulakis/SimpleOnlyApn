//
//  ForegroundPNView.swift
//  SimpleOnlyAPN
//
//  Created by Ioannis Andreoulakis on 30/9/24.
//

import SwiftUI

struct ForegroundPNView: View {
    
    @Binding var title: String
    @Binding var bodyText: String
    @Binding var isVisible: Bool
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            Text(bodyText)
                .font(.subheadline)
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.teal.opacity(0.8))
        .cornerRadius(10)
        .shadow(radius: 4)
        .onTapGesture {
            isVisible = false
        }
        .padding()
    }
}

#Preview {
    ForegroundPNView(title: .constant("This is a test notification title"), bodyText: .constant("This is a test notification body"), isVisible: .constant(true))
}
