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
        
        #if swift(>=3)
        
        let resulting = original.removingOccurrences(of: "hitchhiker")
        
        XCTAssertEqual(original, resulting)
            
        #endif
        
        let oldResulting = original.stringByRemoving("hitchhiker")
        
        XCTAssertEqual(original, oldResulting)
        
    }
    
    func testRemoveAppearingOnlyOnceSubstring() {
        
        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."
        
        #if swift(>=3)
        
        let resulting = original.removingOccurrences(of: "moment")
        
        XCTAssertEqual(resulting, "For a , nothing happened. Then, after a second or so, nothing continued to happen.")
            
        #endif
        
        let oldResulting = original.stringByRemoving("moment")
        
        XCTAssertEqual(oldResulting, "For a , nothing happened. Then, after a second or so, nothing continued to happen.")
        
    }
    
    func testRemoveAppearingMultipleTimesSubstring() {
        
        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."
        
        #if swift(>=3)
        
        let resulting = original.removingOccurrences(of: "nothing")
        
        XCTAssertEqual(resulting, "For a moment,  happened. Then, after a second or so,  continued to happen.")
            
        #endif
        
        let oldResulting = original.stringByRemoving("nothing")
        
        XCTAssertEqual(oldResulting, "For a moment,  happened. Then, after a second or so,  continued to happen.")
        
    }
    
    func testRemoveNotFoundSubstrings() {
     
        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."
        
        #if swift(>=3)
        
        let resulting = original.removingOccurrences(of: ["Douglas", "Adams"])
        
        XCTAssertEqual(original, resulting)
            
        #endif
        
        let oldResulting = original.stringByRemoving(["Douglas", "Adams"])
        
        XCTAssertEqual(original, oldResulting)
        
    }
    
    func testRemoveOneFoundOtherNotSubstrings() {
        
        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."
        
        #if swift(>=3)
        
        let resulting = original.removingOccurrences(of: ["Arthur", "moment"])
        
        XCTAssertEqual(resulting, "For a , nothing happened. Then, after a second or so, nothing continued to happen.")
            
        #endif
        
        let oldResulting = original.stringByRemoving(["Arthur", "moment"])
        
        XCTAssertEqual(oldResulting, "For a , nothing happened. Then, after a second or so, nothing continued to happen.")
        
    }
    
    func testRemoveAppearingOnlyOnceSubstrings() {
        
        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."
        
        #if swift(>=3)
        
        let resulting = original.removingOccurrences(of: ["Then", "moment"])
        
        XCTAssertEqual(resulting, "For a , nothing happened. , after a second or so, nothing continued to happen.")
            
        #endif
        
        let oldResulting = original.stringByRemoving(["Then", "moment"])
        
        XCTAssertEqual(oldResulting, "For a , nothing happened. , after a second or so, nothing continued to happen.")
        
    }
    
    func testRemoveAppearingMultipleTimesSubstrings() {
        
        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."
        
        #if swift(>=3)
        
        let resulting = original.removingOccurrences(of: ["nothing", ","])
        
        XCTAssertEqual(resulting, "For a moment  happened. Then after a second or so  continued to happen.")
            
        #endif
        
        let oldResulting = original.stringByRemoving(["nothing", ","])
        
        XCTAssertEqual(oldResulting, "For a moment  happened. Then after a second or so  continued to happen.")
        
    }
    
}
