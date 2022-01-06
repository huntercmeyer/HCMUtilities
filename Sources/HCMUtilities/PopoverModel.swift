//
//  File.swift
//  
//
//  Created by Hunter Meyer on 1/5/22.
//

import Foundation

@dynamicMemberLookup
public struct PopoverModel<Object>: Identifiable {
    public let id = UUID()
    public let object: Object
    
    public subscript<T>(dynamicMember keyPath: KeyPath<Object, T>) -> T {
        self.object[keyPath: keyPath]
    }
}
