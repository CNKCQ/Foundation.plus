//
//  Character+.swift
//  Foundation+
//
//  Created by steve on 2020/1/19.
//

import Foundation

public extension Character {
    
    static func - (lhs: Character, rhs: Character) -> Int {
        guard let lasc = lhs.asciiValue, let rasc = rhs.asciiValue else {
            return -1
        }
        return Int(lasc - rasc)
    }

    
}



