//
//  DictionaryTests.swift
//  
//
//  Created by Hunter Meyer on 12/31/21.
//

import XCTest
@testable import HCMUtilities

class DictionaryTests: XCTestCase {

    func testFirstKey() {
        let dictionary: [String : Int] = ["Four" : 4, "Ten" : 10, "Twenty Three" : 23]
        let value = dictionary.firstValue(where: { text, _ in
            text.contains("y")
        })
        
        XCTAssertEqual(value, 23)
    }
    
    func testFirstValue() {
        let dictionary: [String : Int] = ["Four" : 4, "Ten" : 10, "Twenty Three" : 23]
        let key = dictionary.firstKey(where: { _, number in
            number % 5 == 0
        })
        
        XCTAssertEqual(key, "Ten")
    }

}
