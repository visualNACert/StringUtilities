//
//  String+Remove.test.swift
//  StringUtilities
//
//  Created by Lluís Ulzurrun de Asanza Sàez on 23/9/16.
//
//

import XCTest
import StringUtilities
import Nimble

class StringRemoveTests: XCTestCase {

    func test__remove_not_found_substring() {

        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."

        let resulting = original.removing("hitchhiker")

        expect(original).to(equal(resulting))


    }

    func test__remove_appearing_only_once_substring() {

        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."

        let resulting = original.removing("moment")

        expect(resulting).to(equal("For a , nothing happened. Then, after a second or so, nothing continued to happen."))

    }

    func test__remove_appearing_multiple_times_substring() {

        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."

        let resulting = original.removing("nothing")

        expect(resulting).to(equal("For a moment,  happened. Then, after a second or so,  continued to happen."))

    }

    func test__remove_not_found_substrings() {

        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."

        let resulting = original.removing(["Douglas", "Adams"])

        expect(original).to(equal(resulting))

    }

    func test__remove_one_found_other_not_substrings() {

        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."

        let resulting = original.removing(["Arthur", "moment"])

        expect(resulting).to(equal("For a , nothing happened. Then, after a second or so, nothing continued to happen."))

    }

    func test__remove_appearing_only_once_substrings() {

        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."

        let resulting = original.removing(["Then", "moment"])

        expect(resulting).to(equal("For a , nothing happened. , after a second or so, nothing continued to happen."))

    }

    func test__remove_appearing_multiple_times_substrings() {

        let original = "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."

        let resulting = original.removing(["nothing", ","])

        expect(resulting).to(equal("For a moment  happened. Then after a second or so  continued to happen."))

    }

}
