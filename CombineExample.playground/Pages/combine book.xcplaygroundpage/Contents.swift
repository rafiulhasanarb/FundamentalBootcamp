import UIKit
import Combine
import Foundation

public func example(of description: String, action: () -> Void) {
    print("\n=== \(description) ===")
    action()
    
}
// Publisher
example(of: "Publisher") {
    // 1
    let myNotification = Notification.Name("myNotification")
    
    // 2
    let publisher = NotificationCenter.default
        .publisher(for: myNotification, object: nil)
    
    // 3
    let center = NotificationCenter.default
    
    // 4
    let observer = center.addObserver(
        forName: myNotification,
        object: nil,
        queue: nil) { notification in
            print("Notification received")
        }
    
    // 5
    center.post(name: myNotification, object: nil)
    
    // 6
    center.removeObserver(observer)
}

// Subscriber

example(of: "Subscriber") {
    let myNotification = Notification.Name("myNotification")
    let center = NotificationCenter.default
    let publisher = center.publisher(for: myNotification, object: nil)
    
    // 1
    let subscription = publisher
        .sink { notification in
            print("Notification received")
        }
    
    // 2
    center.post(name: myNotification, object: nil)
    
    // 3
    subscription.cancel()
}
