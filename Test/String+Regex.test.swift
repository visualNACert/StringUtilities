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
        
        #if swift(>=3.0)
        XCTAssertThrowsError(try html.matches(forPattern: "<img.*src=\\\"([^\"]*\\\".*\\/>"))
        #endif
        
        XCTAssertThrowsError(try html.matchesForRegex("<img.*src=\\\"([^\"]*\\\".*\\/>"))
        
    }
    
    func testNonExistingOneCaptureGroup() {
        
        let html = "<div id=\"content\">"
        
        #if swift(>=3.0)
        
        guard let matches = try? html.matches(
            forPattern: "<img.*src=\\\"([^\"]*)\\\".*\\/>"
        ) else {
            XCTFail("Unexpected exception throw using a valid regex")
            return
        }
        
        XCTAssertEqual(matches.count, 0)
        
        #endif
        
        guard let oldMatches = try? html.matchesForRegex(
            "<img.*src=\\\"([^\"]*)\\\".*\\/>"
        ) else {
            XCTFail("Unexpected exception throw using a valid regex")
            return
        }
        
        
        XCTAssertEqual(oldMatches.count, 0)
        
    }
    
    func testOneCaptureGroup() {
        
        let html = "<img src=\"image_src\" title=\"An image\" alt=\"Some text\" />"
        
        #if swift(>=3.0)
            
        guard let matches = try? html.matches(
            forPattern: "<img.*src=\\\"([^\"]*)\\\".*\\/>"
        ) else {
            XCTFail("Unexpected exception throw using a valid regex")
            return
        }
            
        XCTAssertEqual(matches.count, 2)
        XCTAssertEqual(matches[0], html)
        XCTAssertEqual(matches[1], "image_src")
            
        #endif
        
        guard let oldMatches = try? html.matchesForRegex(
            "<img.*src=\\\"([^\"]*)\\\".*\\/>"
        ) else {
            XCTFail("Unexpected exception throw using a valid regex")
            return
        }
        
        XCTAssertEqual(oldMatches.count, 2)
        XCTAssertEqual(oldMatches[0], html)
        XCTAssertEqual(oldMatches[1], "image_src")
        
    }
    
    func testNonExistingMultipleCaptureGroups() {
        
        let html = "<div id=\"content\">"
        
        #if swift(>=3.0)
            
        guard let matches = try? html.matchesForRegex(
            "<img\\s(?:(?:src=\\\"([^\"]*)\\\"|alt=\\\"([^\"]*)\\\"|title=\\\"([^\"]*)\\\")\\s)+\\/>"
        ) else {
            XCTFail("Unexpected exception throw using a valid regex")
            return
        }
            
        XCTAssertEqual(matches.count, 0)
            
        #endif
    
        guard let oldMatches = try? html.matchesForRegex(
            "<img\\s(?:(?:src=\\\"([^\"]*)\\\"|alt=\\\"([^\"]*)\\\"|title=\\\"([^\"]*)\\\")\\s)+\\/>"
        ) else {
            XCTFail("Unexpected exception throw using a valid regex")
            return
        }
        
        
        XCTAssertEqual(oldMatches.count, 0)
        
    }
    
    func testMultipleCaptureGroupsGreedy() {
        
        let html = "<img src=\"image_src\" title=\"An image\" alt=\"Some text\" />"
        
        #if swift(>=3.0)

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
            
        #endif
        
        guard let oldMatches = try? html.matchesForRegex(
            "<img\\s(?:(?:src=\\\"([^\"]*)\\\"|alt=\\\"([^\"]*)\\\"|title=\\\"([^\"]*)\\\")\\s)+\\/>"
        ) else {
            XCTFail("Unexpected exception throw using a valid regex")
            return
        }
        
        XCTAssertEqual(oldMatches.count, 4)
        XCTAssertEqual(oldMatches[0], html)
        XCTAssertEqual(oldMatches[1], "image_src")
        XCTAssertEqual(oldMatches[2], "Some text")
        XCTAssertEqual(oldMatches[3], "An image")
        
    }
    
    func testPerformance() {
        
        let emailAddress = "someone@somedomain.com"
        
        #if swift(>=3)
        let measureBlock = measure
        #endif
        
        // TODO: Properly measure cache impact...
        /* 
         We should be measuring cache impact with something like this:
         
         1. Repeat X times:
            1. Clear cache.
            2. Measure one run.
         2. Get average runtime of step 2.1 runs.
         3. Measure X runs.
         4. Get average runtime of step 3 runs.
         5. Average of step 4 should be lower than average of step 2.
         */
        
        String.clearRegexCache()
        
        measureBlock {
        
            // Regex should be cached so consecutive iterations should be faster
            #if swift(>=3.0)
                
            guard let matches = try? emailAddress.matchesForRegex(
                "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
            ) else {
                XCTFail("Unexpected exception throw using a valid regex")
                return
            }
                
            XCTAssertEqual(matches.count, 1)
            XCTAssertEqual(matches[0], emailAddress)
            
            #endif
            
            guard let oldMatches = try? emailAddress.matchesForRegex(
                "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
                ) else {
                    XCTFail("Unexpected exception throw using a valid regex")
                    return
            }
            
            XCTAssertEqual(oldMatches.count, 1)
            XCTAssertEqual(oldMatches[0], emailAddress)
            
        }
        
    }

}
