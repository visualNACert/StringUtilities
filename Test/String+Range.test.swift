//
//  String+Range.test.swift
//  StringUtilities
//
//  Created by Lluís Ulzurrun de Asanza Sàez on 23/9/16.
//
//

import XCTest
import StringUtilities
import Nimble

class StringRangeTests: XCTestCase {

    func test__preconditions() {

        expect { _ = "A"[-1..<1] }.to(throwAssertion())
        expect { _ = "A"[0..<2] }.to(throwAssertion())
        expect { _ = "A"[1..<2] }.to(throwAssertion())

    }

    func test__one_character_substring() {

        // One character substring in multiple characters string...
        expect("So long and thanks for all the fish"[0..<1]).to(equal("S"))
        expect("So long and thanks for all the fish"[1..<2]).to(equal("o"))
        expect("So long and thanks for all the fish"[2..<3]).to(equal(" "))
        expect("So long and thanks for all the fish"[34..<35]).to(equal("h"))

        // One character substring in a single character string...
        expect("A"[0..<1]).to(equal("A"))

    }

    func test__multiple_characters_substring() {

        // Multiple characters substring in multiple characters string...
        expect("So long and thanks for all the fish"[0..<2]).to(equal("So"))
        expect("So long and thanks for all the fish"[3..<7]).to(equal("long"))
        expect("So long and thanks for all the fish"[8..<11]).to(equal("and"))
        expect("So long and thanks for all the fish"[31..<35]).to(equal("fish"))

    }

    func test__empty_substring() {

        // Empty substring in multiple characters string...
        expect("So long and thanks for all the fish"[0..<0]).to(equal(""))
        expect("So long and thanks for all the fish"[1..<1]).to(equal(""))
        expect("So long and thanks for all the fish"[2..<2]).to(equal(""))

        // Empty substring in single character string...
        expect("A"[0..<0]).to(equal(""))

        // Empty substring in empty string...
        expect("So long and thanks for all the fish"[0..<0]).to(equal(""))

    }

}
