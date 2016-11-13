//
//  String+Trim.test.swift
//  Example
//
//  Created by Lluís Ulzurrun de Asanza Sàez on 23/9/16.
//
//

import XCTest
import StringUtilities

class StringTrimTests: XCTestCase {
    
    func testTrimLeft() {
        XCTAssertEqual("   Base string".trimmed, "Base string")
        XCTAssertEqual(" Base string".trimmed, "Base string")
        XCTAssertEqual("\tBase string".trimmed, "Base string")
        XCTAssertEqual(" \t   Base string".trimmed, "Base string")
        XCTAssertEqual("\nBase string".trimmed, "Base string")
    }
    
    func testTrimRight() {
        XCTAssertEqual("Base string   ".trimmed, "Base string")
        XCTAssertEqual("Base string ".trimmed, "Base string")
        XCTAssertEqual("Base string\t".trimmed, "Base string")
        XCTAssertEqual("Base string \t ".trimmed, "Base string")
        XCTAssertEqual("Base string\n".trimmed, "Base string")
    }
    
    func testTrimBoth() {
        XCTAssertEqual("   Base string \t ".trimmed, "Base string")
        XCTAssertEqual(" Base string\t".trimmed, "Base string")
        XCTAssertEqual("\t Base string  ".trimmed, "Base string")
        XCTAssertEqual(" \t    Base string ".trimmed, "Base string")
        XCTAssertEqual("\nBase string".trimmed, "Base string")
    }
    
    func testTrimNone() {
        XCTAssertEqual("Base string".trimmed, "Base string")
    }
    
}
