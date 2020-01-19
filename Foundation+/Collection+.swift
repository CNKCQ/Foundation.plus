//
//  Collection+.swift
//  Pods
//
//  Created by Steve on 05/09/2017.
//
//

import Foundation


extension Collection {

    /// Safely access the contents of a collection. Nil if outside of bounds.
    ///
    /// - Parameter index: index
    subscript(safe index: Index) -> Iterator.Element? {
        get {
            return self.lazy.first
        }
        set {
            
        }
    }
}

