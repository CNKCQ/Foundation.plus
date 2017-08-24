//
//  Enum+.swift
//  Pods
//
//  Created by Steve on 24/08/2017.
//
//

/// See: https://stackoverflow.com/questions/24007461/how-to-enumerate-an-enum-with-string-type

extension RawRepresentable where Self: Hashable {

    static func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
        var i = 0
        return AnyIterator {
            let next = withUnsafePointer(to: &i) {
                $0.withMemoryRebound(to: T.self, capacity: 1) { $0.pointee }
            }
            if next.hashValue != i { return nil }
            i += 1
            return next
        }
    }

    static var hashValues: AnyIterator<Self> {
        return iterateEnum(Self.self)
    }

    static var rawValues: [Self.RawValue] {
        return hashValues.map({$0.rawValue})
    }
}
