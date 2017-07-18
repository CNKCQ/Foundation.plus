//
//  Dictionary+.swift
//  Elegant
//
//  Created by Steve on 2017/5/18.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import Foundation

public extension Dictionary {

    /// Returns an element from this sequence shuffled
    var random: Value {
        return Array(values).random
    }

    /// The number of key-value pairs in the dictionary.
    var size: Int {
        return count
    }
}

public extension Dictionary {

    /// Removes all key-value pairs from the dictionary.
    mutating func clear() {
        removeAll()
    }

    /// Removes the given key and its associated value from the dictionary.
    ///
    /// - Parameter key: The key to remove along with its associated value.
    mutating func delete(_ key: Dictionary.Key) {
        removeValue(forKey: key)
    }

    /// The entries() method returns a new Iterator object that contains the [key, value] pairs for each element in the Dictionary object in insertion order.
    ///
    /// - Returns: A new dictionary iterator object.
    @discardableResult
    func entries() -> [(Dictionary.Key, Dictionary.Value)] {
        return flatMap({ ($0.key, $0.value) })
    }

    /// The has() method returns a boolean indicating whether an element with the specified key exists or not.
    ///
    /// - Parameter key: Required. The key of the element to test for presence in the Dictionary object.
    /// - Returns: Returns true if an element with the specified key exists in the Dictionary object; otherwise false.
    @discardableResult
    func has(_ key: Dictionary.Key) -> Bool {
        return keys.contains(key)
    }

    /// Returns a new dictionary of `self` + dicts
    func append(_ dicts: Dictionary) -> Dictionary {
        var results = Dictionary()
        [self, dicts].forEach { dic in
            dic.forEach({ arg in
                let (key, value) = arg
                results[key] = value
            })
        }
        return results
    }
}

public extension Dictionary where Value: Equatable {
    /// See: http://stackoverflow.com/questions/27218669/swift-dictionary-get-key-for-value
    func allKeysForValue(val: Value) -> [Key] {
        return filter { $1 == val }.map { $0.0 }
    }
}
