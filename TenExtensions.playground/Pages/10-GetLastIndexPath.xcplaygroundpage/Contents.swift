//: [Previous](@previous)

import PlaygroundSupport
import UIKit

// Extension #10 - get the last valid indexPath in a UICollectionView.

extension UICollectionView {

    /// Validates whether an `IndexPath` is a valid index path for an item in a collection view.
    ///
    /// - Parameter indexPath: The index path to validate.
    /// - Returns: `true` if the index path represents an item in the collection view or false
    ///     otherwise.
    ///
    func isValid(_ indexPath: IndexPath) -> Bool {
        guard indexPath.section < numberOfSections,
              indexPath.item < numberOfItems(inSection: indexPath.section)
        else {
            return false
        }

        return true
    }

    /// Provides the last valid `indexPath` in the collection view.
    /// - Parameter section: The section used to provide the last `indexPath`.
    /// - Returns: the last valid `indexPath` in the collection view or nil if not a valid `indexPath`.
    func lastIndexPath(in section: Int) -> IndexPath? {
        let lastIndexPath = IndexPath(row: numberOfItems(inSection: section) - 1, section: section)
        guard isValid(lastIndexPath) else { return nil }
        return lastIndexPath
    }
}

// Implementation

class CollectionViewController: UICollectionViewController {

    let items = Array(1...100)

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemBlue
        return cell
    }
}

let collectionViewController = CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
let lastIndexPath = collectionViewController.collectionView.lastIndexPath(in: 0)
lastIndexPath?.section  //0
lastIndexPath?.row      //99

PlaygroundPage.current.liveView = collectionViewController

//: [Next](@next)
