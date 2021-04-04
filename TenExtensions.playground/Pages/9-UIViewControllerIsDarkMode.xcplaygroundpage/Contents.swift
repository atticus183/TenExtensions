//: [Previous](@previous)

import UIKit

// Extension #9

extension UIViewController {
    /// Gets a flag indicating whether or not the UI is in dark mode.
    public var isDarkMode: Bool {
        if #available(iOS 12.0, *) {
            return traitCollection.userInterfaceStyle == .dark
        }
        return false
    }
}

//: [Next](@next)
