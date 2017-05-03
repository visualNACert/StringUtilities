//
//  String+Trim.test.swift
//  StringUtilities
//
//  Created by Lluís Ulzurrun de Asanza Sàez on 23/9/16.
//
//

import XCTest
import StringUtilities
import Nimble

class StringTrimTests: XCTestCase {

    func test__trim_left() {
        expect("   Base string".trimmed).to(equal("Base string"))
        expect(" Base string".trimmed).to(equal("Base string"))
        expect("\tBase string".trimmed).to(equal("Base string"))
        expect(" \t   Base string".trimmed).to(equal("Base string"))
        expect("\nBase string".trimmed).to(equal("Base string"))
    }

    func test__trim_right() {
        expect("Base string   ".trimmed).to(equal("Base string"))
        expect("Base string ".trimmed).to(equal("Base string"))
        expect("Base string\t".trimmed).to(equal("Base string"))
        expect("Base string \t ".trimmed).to(equal("Base string"))
        expect("Base string\n".trimmed).to(equal("Base string"))
    }

    func test__trim_both() {
        expect("   Base string \t ".trimmed).to(equal("Base string"))
        expect(" Base string\t".trimmed).to(equal("Base string"))
        expect("\t Base string  ".trimmed).to(equal("Base string"))
        expect(" \t    Base string ".trimmed).to(equal("Base string"))
        expect("\nBase string".trimmed).to(equal("Base string"))
    }

    func test__trim_bone() {
        expect("Base string".trimmed).to(equal("Base string"))
    }

}
