//
//  BidirectionalCollection+NaturalJoin.test.swift
//  StringUtilities
//
//  Created by Lluís Ulzurrun de Asanza Sàez on 2/1/17.
//
//

import XCTest
import StringUtilities
import Nimble

class NaturalJoinTests: XCTestCase {

    func test__empty() {
        expect(
            [String]().joined(separator: ", ", lastElementSeparator: " and ")
        ).to(equal(""))
    }

    func test__one() {
        expect(
            ["one"].joined(separator: ", ", lastElementSeparator: " and ")
        ).to(equal("one"))
    }

    func test__two() {
        expect(
            ["one", "two"].joined(separator: ", ", lastElementSeparator: " and ")
        ).to(equal("one and two"))
    }

    func test__three() {
        expect(
            ["one", "two", "three"].joined(separator: ", ", lastElementSeparator: " and ")
        ).to(equal("one, two and three"))
    }

}
