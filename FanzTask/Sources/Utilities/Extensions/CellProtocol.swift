//
//  UITableView+Extension.swift
//  FanzTask
//
//  Created by Ammar.M on 30/03/2024.
//

import UIKit

// MARK: - ...  Cell Error
public enum CellError: Error {
    case confirmProtocol
}
// MARK: - ...  Cell Protocol Must all cells implement this protocol
public protocol CellProtocol {
    var model: Any? { get set }
    var path: Int? { get set }
    func indexPath() -> Int
    func setup()
}

private var modelOfCollectionCell: [UICollectionViewCell: Any] = [:]
private var modelOfTableCell: [UITableViewCell: Any] = [:]
private var pathOfCollectionCell: [UICollectionViewCell: Int] = [:]
private var pathOfTableCell: [UITableViewCell: Int] = [:]

public extension CellProtocol {
    /// index path of item
    var path: Int? {
        set {
            guard let index = newValue else { return }
            if self is UICollectionViewCell {
                guard let cell = self as? UICollectionViewCell else { return }
                pathOfCollectionCell[cell] = index
            } else if self is UITableViewCell {
                guard let cell = self as? UITableViewCell else { return }
                pathOfTableCell[cell] = newValue
            }
        } get {
            if self is UICollectionViewCell {
                guard let cell = self as? UICollectionViewCell else { return nil }
                guard let index = pathOfCollectionCell[cell] else { return nil }
                return index
            } else if self is UITableViewCell {
                guard let cell = self as? UITableViewCell else { return nil }
                guard let index = pathOfTableCell[cell] else { return nil }
                return index
            } else {
                return nil
            }
        }
    }
    
    var model: Any? {
        
        set {
            if self is UICollectionViewCell {
                guard let cell = self as? UICollectionViewCell else { return }
                modelOfCollectionCell[cell] = newValue
            } else if self is UITableViewCell {
                guard let cell = self as? UITableViewCell else { return }
                modelOfTableCell[cell] = newValue
            }
            setup()
        } get {
            
            if self is UICollectionViewCell {
                guard let cell = self as? UICollectionViewCell else { return nil }
                return modelOfCollectionCell[cell]
            } else if self is UITableViewCell {
                guard let cell = self as? UITableViewCell else { return nil }
                return modelOfTableCell[cell]
            } else {
                return nil
            }
        }
    }
    
    func indexPath() -> Int {
        guard let path = self.path else { return 0 }
        return path
    }
}
