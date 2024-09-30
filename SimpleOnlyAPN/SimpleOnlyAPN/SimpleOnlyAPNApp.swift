//
//  SimpleOnlyAPNApp.swift
//  SimpleOnlyAPN
//
//  Created by Ioannis Andreoulakis on 27/9/24.
//

import SwiftUI

@main
struct SimpleOnlyAPNApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: CustomAppDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appDelegate)
                .onAppear(perform: {
                    appDelegate.app = self
                })
        }
    }
}
