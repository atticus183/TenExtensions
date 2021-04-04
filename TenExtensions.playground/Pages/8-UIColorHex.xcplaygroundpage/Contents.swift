//: [Previous](@previous)

import UIKit

// Extension #8 - generates a string with the hex color value.

extension UIColor {
    // MARK: - Helper Functions
    /// Returns the hex string for this `UIColor`. For example: `#FFFFFF` or `#222222AB` if the alpha value is included.
    ///
    /// - Parameter includeAlpha: A boolean indicating if the alpha value should be included in the returned hex string.
    ///
    /// - Returns: The hex string for this `UIColor`. For example: `#FFFFFF` or
    ///            `#222222AB` if the alpha value is included.
    ///
    func hexString(includeAlpha: Bool = false) -> String {
        let components = cgColor.components
        let red: CGFloat = components?[0] ?? 0.0
        let green: CGFloat = components?[1] ?? 0.0
        let blue: CGFloat = components?[2] ?? 0.0
        let alpha: CGFloat = components?[3] ?? 0.0
        let hexString = String.init(
            format: "#%02lX%02lX%02lX%02lX",
            lroundf(Float(red * 255)),
            lroundf(Float(green * 255)),
            lroundf(Float(blue * 255)),
            lroundf(Float(alpha * 255))
        )
        return includeAlpha ? hexString : String(hexString.dropLast(2))
    }
}

// Implementation

let whiteColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 1)

let whiteHexString = whiteColor.hexString() //#FFFFFF

let blackColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)

let blackHexString = blackColor.hexString() //#000000

//: [Next](@next)
