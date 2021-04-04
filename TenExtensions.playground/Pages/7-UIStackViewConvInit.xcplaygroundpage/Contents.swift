//: [Previous](@previous)

import PlaygroundSupport
import UIKit

// Extension #7 - Make UIStackView creation a lot easier.

extension UIStackView {

    /// `UIStackView` convenience initializer for creating a stack view with arranged subviews, an
    /// axis and spacing.
    ///
    /// - Parameters:
    ///   - alignment: The alignment of the arranged subviews perpendicular to the stack view’s
    ///                axis.
    ///   - arrangedSubviews: The subviews to arrange in the `UIStackView`.
    ///   - axis: The axis that the subviews should be arranged around.
    ///   - distribution: The distribution of the arranged views along the stack view’s axis.
    ///   - spacing: The spacing to place between each arranged subview. Defaults to 0.
    ///
    convenience init(alignment: UIStackView.Alignment = .fill,
                     arrangedSubviews: [UIView],
                     axis: NSLayoutConstraint.Axis,
                     distribution: UIStackView.Distribution = .fill,
                     spacing: CGFloat = 0) {
        arrangedSubviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        self.init(arrangedSubviews: arrangedSubviews)
        self.alignment = alignment
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
    }
}

// Implementation

let view1 = UIView()
view1.backgroundColor = .systemPink
let view2 = UIView()
view2.backgroundColor = .systemOrange
let view3 = UIView()
view3.backgroundColor = .systemTeal

let stackView = UIStackView(alignment: .leading,
                            arrangedSubviews: [view1, view2, view3],
                            axis: .vertical,
                            distribution: .fill,
                            spacing: 20)



let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
view.backgroundColor = .systemBlue
view.addSubview(stackView)
stackView.translatesAutoresizingMaskIntoConstraints = false

NSLayoutConstraint.activate([
    view1.heightAnchor.constraint(equalToConstant: 50),
    view1.widthAnchor.constraint(equalToConstant: 150),
    view2.heightAnchor.constraint(equalToConstant: 50),
    view2.widthAnchor.constraint(equalToConstant: 150),
    view3.heightAnchor.constraint(equalToConstant: 50),
    view3.widthAnchor.constraint(equalToConstant: 150),
    stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
])

PlaygroundPage.current.liveView = view

//: [Next](@next)
