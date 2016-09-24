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
        
        let resulting = original.stringByRemoving("hitchhiker")
        
        XCTAssertEqual(original, resulting)
        
    }
    
    func testRemoveAppearingOnlyOnceSubstring() {
        
        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."
        
        let resulting = original.stringByRemoving("moment")
        
        XCTAssertEqual(resulting, "For a , nothing happened. Then, after a second or so, nothing continued to happen.")
        
    }
    
    func testRemoveAppearingMultipleTimesSubstring() {
        
        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."
        
        let resulting = original.stringByRemoving("nothing")
        
        XCTAssertEqual(resulting, "For a moment,  happened. Then, after a second or so,  continued to happen.")
        
    }
    
    func testRemoveNotFoundSubstrings() {
     
        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."
        
        let resulting = original.stringByRemoving(["Douglas", "Adams"])
        
        XCTAssertEqual(original, resulting)
        
    }
    
    func testRemoveOneFoundOtherNotSubstrings() {
        
        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."
        
        let resulting = original.stringByRemoving(["Arthur", "moment"])
        
        XCTAssertEqual(resulting, "For a , nothing happened. Then, after a second or so, nothing continued to happen.")
        
    }
    
    func testRemoveAppearingOnlyOnceSubstrings() {
        
        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."
        
        let resulting = original.stringByRemoving(["Then", "moment"])
        
        XCTAssertEqual(resulting, "For a , nothing happened. , after a second or so, nothing continued to happen.")
        
    }
    
    func testRemoveAppearingMultipleTimesSubstrings() {
        
        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."
        
        let resulting = original.stringByRemoving(["nothing", ","])
        
        XCTAssertEqual(resulting, "For a moment  happened. Then after a second or so  continued to happen.")
        
    }
    
}
