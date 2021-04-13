//: [Previous](@previous)

import Foundation

// Extension #3 - Retrieves valid URLs from a given string.

//Credit - Thanks to Paul Hudson for the core functionality on this extension.
//Source - https://www.hackingwithswift.com/example-code/strings/how-to-detect-a-url-in-a-string-using-nsdatadetector

extension String {
    /// Searches through a string to find valid URLs.
    /// - Returns: An array of found URLs.
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
