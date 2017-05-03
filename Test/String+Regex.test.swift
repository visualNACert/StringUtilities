//
//  String+Regex.test.swift
//  StringUtilities
//
//  Created by Lluís Ulzurrun de Asanza Sàez on 23/9/16.
//
//

import XCTest
import StringUtilities
import Nimble

class StringRegexTests: XCTestCase {

    func test__throws_on_malformed_regex() {

        let html = "<img src=\"image_src\" title=\"An image\" alt=\"Some text\" />"

        expect {
            _ = try html.matches(for: "<img.*src=\\\"([^\"]*\\\".*\\/>")
        }.to(throwError())

    }

    func test__non_existing_one_capture_group() {

        let html = "<div id=\"content\">"

        expect { _ -> Void in

            let matches = try html.matches(
                for: "<img.*src=\\\"([^\"]*)\\\".*\\/>"
            )

            expect(matches).to(haveCount(0))

        }.toNot(throwAssertion())

    }

    func test__one_capture_group() {

        let html = "<img src=\"image_src\" title=\"An image\" alt=\"Some text\" />"

        expect { _ -> Void in

            let matches = try html.matches(
                for: "<img.*src=\\\"([^\"]*)\\\".*\\/>"
            )

            expect(matches).to(haveCount(2))
            expect(matches[0]).to(equal(html))
            expect(matches[1]).to(equal("image_src"))

        }.toNot(throwAssertion())

    }

    func test__non_existing_multiple_capture_groups() {

        let html = "<div id=\"content\">"

        expect { _ -> Void in

            let matches = try html.matches(
                for: "<img\\s(?:(?:src=\\\"([^\"]*)\\\"|alt=\\\"([^\"]*)\\\"|title=\\\"([^\"]*)\\\")\\s)+\\/>"
            )

            expect(matches).to(haveCount(0))

        }.toNot(throwAssertion())

    }

    func test__multiple_capture_groups_greedy() {

        let html = "<img src=\"image_src\" title=\"An image\" alt=\"Some text\" />"

        expect { _ -> Void in

            let matches = try html.matches(
                for: "<img\\s(?:(?:src=\\\"([^\"]*)\\\"|alt=\\\"([^\"]*)\\\"|title=\\\"([^\"]*)\\\")\\s)+\\/>"
            )

            expect(matches).to(haveCount(4))

            expect(matches[0]).to(equal(html))
            expect(matches[1]).to(equal("image_src"))
            expect(matches[2]).to(equal("Some text"))
            expect(matches[3]).to(equal("An image"))

        }.toNot(throwAssertion())

    }

    func test__performance_uncached() {

        let emailAddress = "someone@somedomain.com"

        let test: (Void) -> Void = { _ -> Void in

            expect { _ -> Void in

                // Regex should be cached so consecutive iterations should be
                // faster
                let matches = try emailAddress.matches(
                    for: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
                )

                expect(matches).to(haveCount(1))
                expect(matches[0]).to(equal(emailAddress))

                }.toNot(throwAssertion())

        }

        String.clearRegexCache()

        measure {
            test()
            String.clearRegexCache()
        }

        String.clearRegexCache()

    }

    func test__performance_cached() {

        let emailAddress = "someone@somedomain.com"

        let test: (Void) -> Void = { _ -> Void in

            expect { _ -> Void in

                // Regex should be cached so consecutive iterations should be
                // faster
                let matches = try emailAddress.matches(
                    for: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
                )

                expect(matches).to(haveCount(1))
                expect(matches[0]).to(equal(emailAddress))

            }.toNot(throwAssertion())

        }

        String.clearRegexCache()

        test()

        measure { test() }

        String.clearRegexCache()

    }

}
