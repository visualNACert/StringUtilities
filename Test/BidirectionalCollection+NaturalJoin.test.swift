//
//  BidirectionalCollection+NaturalJoin.test.swift
//  Example
//
//  Created by Lluís Ulzurrun de Asanza Sàez on 2/1/17.
//
//

import XCTest
import StringUtilities

class NaturalJoinTests: XCTestCase {
    
    func testEmpty() {
        XCTAssertEqual(    
            [String]().joined(separator: ", ", lastElementSeparator: " and "),
            ""
        )
    }
    
    func testOne() {
        XCTAssertEqual(
            ["one"].joined(separator: ", ", lastElementSeparator: " and "),
            "one"
        )
    }
    
    func testTwo() {
        XCTAssertEqual(
            ["one", "two"].joined(separator: ", ", lastElementSeparator: " and "),
            "one and two"
        )
    }
    
    func testThree() {
        XCTAssertEqual(
            ["one", "two", "three"].joined(separator: ", ", lastElementSeparator: " and "),
            "one, two and three"
        )
    }
    
}
