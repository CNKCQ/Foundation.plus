//
//  Math+.swift
//  Foundation+
//
//  Created by steve on 2020/3/3.
//

import Foundation


func min(_ input: Int...) -> Int {
    guard input.count > 0 else {
        fatalError("please input valid params")
    }
    return input.sorted(by: { $0 < $1}).first!
}

func max(_ input: Int...) -> Int {
    guard input.count > 0 else {
        fatalError("please input valid params")
    }
    return input.sorted(by: { $0 < $1}).last!
}

func sum(_ input: Int...) -> Int {
    guard input.count > 0 else {
        fatalError("please input valid params")
    }
    return input.reduce(0, +)
}
