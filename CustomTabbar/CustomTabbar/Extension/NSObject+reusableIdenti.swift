//
//  NSObject+reusableIdenti.swift
//  CustomTabbar
//
//  Created by Apple on 2020/08/09.
//  Copyright © 2020 minjae. All rights reserved.
//

import Foundation

extension NSObject {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
