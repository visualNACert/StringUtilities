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
        XCTAssertEqual("   Base string".trimmedString(), "Base string")
        XCTAssertEqual(" Base string".trimmedString(), "Base string")
        XCTAssertEqual("\tBase string".trimmedString(), "Base string")
        XCTAssertEqual(" \t   Base string".trimmedString(), "Base string")
        XCTAssertEqual("\nBase string".trimmedString(), "Base string")
    }
    
    func testTrimRight() {
        XCTAssertEqual("Base string   ".trimmedString(), "Base string")
        XCTAssertEqual("Base string ".trimmedString(), "Base string")
        XCTAssertEqual("Base string\t".trimmedString(), "Base string")
        XCTAssertEqual("Base string \t ".trimmedString(), "Base string")
        XCTAssertEqual("Base string\n".trimmedString(), "Base string")
    }
    
    func testTrimBoth() {
        XCTAssertEqual("   Base string \t ".trimmedString(), "Base string")
        XCTAssertEqual(" Base string\t".trimmedString(), "Base string")
        XCTAssertEqual("\t Base string  ".trimmedString(), "Base string")
        XCTAssertEqual(" \t    Base string ".trimmedString(), "Base string")
        XCTAssertEqual("\nBase string".trimmedString(), "Base string")
    }
    
    func testTrimNone() {
        XCTAssertEqual("Base string".trimmedString(), "Base string")
    }
    
}
