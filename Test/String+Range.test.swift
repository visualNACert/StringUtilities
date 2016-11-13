//
//  String+Range.test.swift
//  StringUtilities-macOS
//
//  Created by Lluís Ulzurrun de Asanza Sàez on 23/9/16.
//
//

import XCTest
import StringUtilities

class StringRangeTests: XCTestCase {
    
    func testOneCharacterSubstring() {
        
        // One character substring in multiple characters string...
        XCTAssertEqual("So long and thanks for all the fish"[0..<1], "S")
        XCTAssertEqual("So long and thanks for all the fish"[1..<2], "o")
        XCTAssertEqual("So long and thanks for all the fish"[2..<3], " ")
        XCTAssertEqual("So long and thanks for all the fish"[34..<35], "h")
        
        // One character substring in a single character string...
        XCTAssertEqual("A"[0..<1], "A")
        
    }
    
    func testMultipleCharactersSubstring() {
        
        // Multiple characters substring in multiple characters string...
        XCTAssertEqual("So long and thanks for all the fish"[0..<2], "So")
        XCTAssertEqual("So long and thanks for all the fish"[3..<7], "long")
        XCTAssertEqual("So long and thanks for all the fish"[8..<11], "and")
        XCTAssertEqual("So long and thanks for all the fish"[31..<35], "fish")
        
    }
    
    func testEmptySubstring() {
        
        // Empty substring in multiple characters string...
        XCTAssertEqual("So long and thanks for all the fish"[0..<0], "")
        XCTAssertEqual("So long and thanks for all the fish"[1..<1], "")
        XCTAssertEqual("So long and thanks for all the fish"[2..<2], "")
        
        // Empty substring in single character string...
        XCTAssertEqual("A"[0..<0], "")
        
        // Empty substring in empty string...
        XCTAssertEqual("So long and thanks for all the fish"[0..<0], "")
        
    }
    
}
