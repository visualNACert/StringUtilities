//
//  String+Remove.test.swift
//  Example
//
//  Created by Lluís Ulzurrun de Asanza Sàez on 23/9/16.
//
//

import XCTest
import StringUtilities

class StringRemoveTests: XCTestCase {
    
    func testRemoveNotFoundSubstring() {
        
        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."
        
        let resulting = original.removing("hitchhiker")
        
        XCTAssertEqual(original, resulting)

        
    }
    
    func testRemoveAppearingOnlyOnceSubstring() {
        
        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."
        
        let resulting = original.removing("moment")
        
        XCTAssertEqual(resulting, "For a , nothing happened. Then, after a second or so, nothing continued to happen.")
        
    }
    
    func testRemoveAppearingMultipleTimesSubstring() {
        
        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."
    
        let resulting = original.removing("nothing")
        
        XCTAssertEqual(resulting, "For a moment,  happened. Then, after a second or so,  continued to happen.")
        
    }
    
    func testRemoveNotFoundSubstrings() {
     
        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."
        
        let resulting = original.removing(["Douglas", "Adams"])
        
        XCTAssertEqual(original, resulting)
        
    }
    
    func testRemoveOneFoundOtherNotSubstrings() {
        
        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."
        
        let resulting = original.removing(["Arthur", "moment"])
        
        XCTAssertEqual(resulting, "For a , nothing happened. Then, after a second or so, nothing continued to happen.")
        
    }
    
    func testRemoveAppearingOnlyOnceSubstrings() {
        
        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."
        
        let resulting = original.removing(["Then", "moment"])
        
        XCTAssertEqual(resulting, "For a , nothing happened. , after a second or so, nothing continued to happen.")
        
    }
    
    func testRemoveAppearingMultipleTimesSubstrings() {
        
        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."
        
        let resulting = original.removing(["nothing", ","])
        
        XCTAssertEqual(resulting, "For a moment  happened. Then after a second or so  continued to happen.")
        
    }
    
}
