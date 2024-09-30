//
//  ContentView.swift
//  SimpleOnlyAPN
//
//  Created by Ioannis Andreoulakis on 27/9/24.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    @EnvironmentObject var appDelegate: CustomAppDelegate
    let notificationCenter = UNUserNotificationCenter.current()
    
    var body: some View {
        ZStack {
            VStack {
                Button("Request Notification Access") {
                    Task {
                        let notificationCenter = UNUserNotificationCenter.current()
                        do {
                            try await notificationCenter.requestAuthorization(options: [.alert, .badge, .sound])
                        } catch {
                            print("Request authorization error")
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            
            if appDelegate.showOverlayNotification {
                ForegroundPNView(
                    title: $appDelegate.notificationTitle,
                    bodyText: $appDelegate.notificationBody,
                    isVisible: $appDelegate.showOverlayNotification
                )
                .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .animation(.easeInOut, value: appDelegate.showOverlayNotification)
    }
}

#Preview {
    ContentView()
        .environmentObject(CustomAppDelegate())
}
