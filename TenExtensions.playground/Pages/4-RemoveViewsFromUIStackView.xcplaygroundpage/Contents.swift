//: [Previous](@previous)

import UIKit

// Extension #4 - Removes all views from a UIStackView.

extension UIStackView {
    /// Removes all arranged subviews and their constraints from the view.
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach {
            self.removeArrangedSubview($0)
            NSLayoutConstraint.deactivate($0.constraints)
            $0.removeFromSuperview()
        }
    }
}

// Implementation

let view1 = UIView()
let view2 = UIView()
let view3 = UIView()

let stackView = UIStackView()

//Add subviews to stackView
stackView.addArrangedSubview(view1)
stackView.addArrangedSubview(view2)
stackView.addArrangedSubview(view3)

//Confirm stackView contains 3 views
stackView.arrangedSubviews.count

//Remove views from stackView
stackView.removeAllArrangedSubviews()

//Confirm stackView doesn't contain any subviews now
stackView.arrangedSubviews.count

//: [Next](@next)
