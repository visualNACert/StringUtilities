//
//  String+Regex.test.swift
//  Example
//
//  Created by Lluís Ulzurrun de Asanza Sàez on 23/9/16.
//
//

import XCTest
import StringUtilities

class StringRegexTests: XCTestCase {
    
    func testThrowsOnMalformedRegex() {
        
        let html = "<img src=\"image_src\" title=\"An image\" alt=\"Some text\" />"
        
        XCTAssertThrowsError(try html.matchesForRegex("<img.*src=\\\"([^\"]*\\\".*\\/>"))
        
    }
    
    func testNonExistingOneCaptureGroup() {
        
        let html = "<div id=\"content\">"
        
        guard let matches = try? html.matchesForRegex(
            "<img.*src=\\\"([^\"]*)\\\".*\\/>"
            ) else {
                XCTFail("Unexpected exception throw using a valid regex")
                return
        }
        
        XCTAssertEqual(matches.count, 0)
        
    }
    
    func testOneCaptureGroup() {
        
        let html = "<img src=\"image_src\" title=\"An image\" alt=\"Some text\" />"
        
        guard let matches = try? html.matchesForRegex(
            "<img.*src=\\\"([^\"]*)\\\".*\\/>"
        ) else {
            XCTFail("Unexpected exception throw using a valid regex")
            return
        }
        
        XCTAssertEqual(matches.count, 2)
        XCTAssertEqual(matches[0], html)
        XCTAssertEqual(matches[1], "image_src")
        
    }
    
    func testNonExistingMultipleCaptureGroups() {
        
        let html = "<div id=\"content\">"
        
        guard let matches = try? html.matchesForRegex(
            "<img\\s(?:(?:src=\\\"([^\"]*)\\\"|alt=\\\"([^\"]*)\\\"|title=\\\"([^\"]*)\\\")\\s)+\\/>"
            ) else {
                XCTFail("Unexpected exception throw using a valid regex")
                return
        }
        
        XCTAssertEqual(matches.count, 0)
        
    }
    
    func testMultipleCaptureGroupsGreedy() {
        
        let html = "<img src=\"image_src\" title=\"An image\" alt=\"Some text\" />"
        
        guard let matches = try? html.matchesForRegex(
            "<img\\s(?:(?:src=\\\"([^\"]*)\\\"|alt=\\\"([^\"]*)\\\"|title=\\\"([^\"]*)\\\")\\s)+\\/>"
        ) else {
            XCTFail("Unexpected exception throw using a valid regex")
            return
        }
        
        XCTAssertEqual(matches.count, 4)
        XCTAssertEqual(matches[0], html)
        XCTAssertEqual(matches[1], "image_src")
        XCTAssertEqual(matches[2], "Some text")
        XCTAssertEqual(matches[3], "An image")
        
    }
    
    func testPerformance() {
        
        let emailAddress = "someone@somedomain.com"
        
        measureBlock {
        
            // Regex should be cached so consecutive iterations should be faster
            guard let matches = try? emailAddress.matchesForRegex(
                "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
                ) else {
                    XCTFail("Unexpected exception throw using a valid regex")
                    return
            }
            
            XCTAssertEqual(matches.count, 1)
            XCTAssertEqual(matches[0], emailAddress)
            
        }
        
    }

}
