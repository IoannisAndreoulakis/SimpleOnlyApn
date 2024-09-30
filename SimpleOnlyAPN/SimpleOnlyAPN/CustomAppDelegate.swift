//
//  CustomAppDelegate.swift
//  SimpleOnlyAPN
//
//  Created by Ioannis Andreoulakis on 30/9/24.
//

//  CustomAppDelegate.swift
import SwiftUI
import UserNotifications

class CustomAppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    var app: SimpleOnlyAPNApp?
    
    @Published var notificationTitle = ""
    @Published var notificationBody = ""
    @Published var showOverlayNotification = false
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        application.registerForRemoteNotifications()
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let stringifiedToken = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("stringifiedToken:", stringifiedToken)
    }
}

extension CustomAppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        if let aps = notification.request.content.userInfo["aps"] as? [String: Any],
           let alert = aps["alert"] as? [String: Any] {
            self.notificationTitle = alert["title"] as? String ?? "No Title"
            self.notificationBody = alert["body"] as? String ?? "No Body"
        }
        
        showOverlayNotification = true
        
        return []
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        print("Notification tapped, title: \(response.notification.request.content.title)")
    }
}
