//
//  NSNumber+.swift
//  Elegant
//
//  Created by Steve on 2017/8/14.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import Foundation

extension NSNumber {

    /// A value of the Bool tpye
    var isBool: Bool {
        return type(of: self) == type(of: NSNumber(value: true))
    }
}
