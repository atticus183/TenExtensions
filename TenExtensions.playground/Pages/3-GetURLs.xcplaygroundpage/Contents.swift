//: [Previous](@previous)

import Foundation

// Extension #3 - Retrieves valid URLs from a given string.

extension String {
    /// Searches through a string to find a valid URL.  The method will return the last valid URL in the string.
    /// - Returns: A the last valid URL or nil.
    func getURLs() -> [URL] {
        var foundUrls = [URL]()
        guard let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else {
            return foundUrls
        }
        let matches = detector.matches(
            in: self,
            options: [],
            range: NSRange(location: 0, length: self.utf16.count)
        )
        for match in matches {
            guard let range = Range(match.range, in: self),
                  let retrievedURL = URL(string: String(self[range])) else { continue }
            foundUrls.append(retrievedURL)
        }
        return foundUrls
    }
}

// Implementation

let unfilteredString = "To get the best search results, go to https://www.google.com, www.duckduckgo.com, or www.bing.com"
let urls = unfilteredString.getURLs()

//: [Next](@next)
