//
//  NotificationHandler.swift
//  QuetzalBank
//
//  Created by imac 10 on 15/06/23.
//

import Foundation
import UserNotifications

class NotificationHandler {
    var title: String
    var subtitle: String
    var body: String
    
    init(title: String, subtitle: String, body: String) {
        self.title = title
        self.subtitle = subtitle
        self.body = body
    }
    
    func showNotification(){
        let trigger =
        UNTimeIntervalNotificationTrigger(timeInterval:
        10, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    func requestPermission(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]){granted, error in
            if granted {
                print("Se permitio el uso de notificaciones")
            }else {
                print("No se concedipo permiso")
            }
        }
    }
}
