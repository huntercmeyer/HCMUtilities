//
//  File.swift
//  
//
//  Created by Hunter Meyer on 12/31/21.
//

import Foundation

extension Dictionary {
    /// Returns the key to the first element in the dictionary that satifies the given predicate, if there is one.
    /// - Parameter predicate: A closure that takes an element of the dictionary as an argument and returns a Boolean indicating whether the element is a match.
    /// - Returns: The key of the first dictionary element that satisfies the predicate, or nil if no elements satisfy the predicate.
    public func firstKey(where predicate: (Key, Value) -> Bool) -> Key? {
        return self.first(where: predicate)?.key
    }
}
