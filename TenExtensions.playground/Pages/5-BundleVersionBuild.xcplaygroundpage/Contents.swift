//: [Previous](@previous)

import Foundation

// Extension #5 - retrieve the app version # and build #.

extension Bundle {
    /// Retrieve the app version # from Bundle
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }

    /// Retrieve the build version # from Bundle
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}

// Implementation

let releaseVersionNumber = Bundle.main.releaseVersionNumber
let buildVersionNumber = Bundle.main.buildVersionNumber


//: [Next](@next)
