//: [Previous](@previous)

import Foundation

// Extension #6 - Get the prior year as an integer

extension Calendar {
    /// Returns the prior year as an integer.
    ///
    /// - Returns: Returns last year's year as an integer.
    func priorYear() -> Int {
        guard let priorYear = date(byAdding: .year, value: -1, to: Date()) else {
            return component(.year, from: Date()) - 1
        }
        return component(.year, from: priorYear)
    }
}

//Implementation

let priorYearAsNumber = Calendar.current.priorYear()

//: [Next](@next)
