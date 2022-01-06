//
//  File.swift
//  
//
//  Created by Hunter Meyer on 1/5/22.
//

import Foundation

@dynamicMemberLookup
struct PopoverModel<Object>: Identifiable {
    let id = UUID()
    let object: Object
    
    subscript<T>(dynamicMember keyPath: KeyPath<Object, T>) -> T {
        self.object[keyPath: keyPath]
    }
}
