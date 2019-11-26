//
//  String+.swift
//  Elegant
//
//  Created by Steve on 2017/5/18.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import Foundation
import UIKit

public extension String {

    /// Returns floatValue
    var float: Float? {
        let numberFormatter = NumberFormatter()
        return numberFormatter.number(from: self)?.floatValue
    }

    /// Returns doubleValue
    var double: Double? {
        let numberFormatter = NumberFormatter()
        return numberFormatter.number(from: self)?.doubleValue
    }

    /// Returns cgFloatValue
    var cgFloat: CGFloat {
        return CGFloat(double ?? 0)
    }

    /// The string length property returns the count of character in the string.
    var length: Int {
        return characters.count
    }

    /// Returns a localized string, using the main bundle.
    var locale: String {
        return NSLocalizedString(self, tableName: "Default", bundle: Bundle.main, value: "", comment: "")
    }

    /// Returns a lowercase version of the string.
    var lowercased: String {
        return lowercased()
    }

    /// Returns an uppercase version of the string.
    var uppercased: String {
        return uppercased()
    }

    /// Returns a new string made from the receiver by replacing all characters not in the unreservedCharset with percent-encoded characters.
    var encoding: String? {
        let unreservedChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~"
        let unreservedCharset = CharacterSet(charactersIn: unreservedChars)
        return addingPercentEncoding(withAllowedCharacters: unreservedCharset)
    }

    /// Returns a new string made from the receiver by replacing all percent encoded sequences with the matching UTF-8 characters.
    var decoding: String? {
        return removingPercentEncoding
    }


}

public extension String {

    /// Accesses the element at the specified position. Support "abc"[-1] == "c"
    ///
    /// - Parameter index: The position of the element to access.
    subscript(index: Int) -> Character {
        let idx = index < 0 ? (length - abs(index)) : index
        return self[self.index(startIndex, offsetBy: idx)]
    }

    /// Accesses a contiguous subrange of the string's characters.
    ///
    /// - Parameter range: A range of integers.
    subscript(range: Range<Int>) -> String {
        return substring(with: index(startIndex, offsetBy: range.lowerBound) ..< index(startIndex, offsetBy: range.upperBound))
    }


    /// Return a string which hasSuffix with the parameter
    public func suffix(with end: String) -> String {
        guard !self.hasSuffix(end) else { return self }
        return self + end
    }

    /// - Returns: return the compare result
    func isEqual(_ to: String) -> Bool {
        return self == to
    }

    /// Returns a new string made by removing from both ends of the String characters contained in a given character set.
    ///
    /// - Parameter set: Character set, default is .whitespaces.
    /// - Returns: A new string
    func trimmed(set: CharacterSet = .whitespaces) -> String {
        return trimmingCharacters(in: set)
    }

    /// - Returns: A new string without spaces
    func trimAllspace() -> String {
        return trimmed().replacingOccurrences(of: " ", with: "")
    }

    /// Returns a new camelCaseString
    ///
    /// - Parameter separator: A specail character
    /// - Returns: camelCaseString
    func camelCaseString(separator: String = "_") -> String {
        if isEmpty {
            return self
        }
        let first = self[0]
        var rest = capitalized.replacingOccurrences(of: separator, with: "")
        rest.remove(at: startIndex)
        return "\(first)\(rest)"
    }
}

extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let options = [.usesLineFragmentOrigin, .usesFontLeading]
        let attributes = [NSAttributedString.Key.font: font]
        let boundingBox = self.boundingRect(with: constraintRect, options: options, attributes: attributes, context: nil)
        return boundingBox.height
    }
    
    func widthWithConstrainedHeight(height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let options = [.usesLineFragmentOrigin, .usesFontLeading]
        let attributes = [NSAttributedString.Key.font: font]
        let boundingBox = self.boundingRect(with: constraintRect, options: options, attributes: attributes, context: nil)
        return boundingBox.width
    }
}
