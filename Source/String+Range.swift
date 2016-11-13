//
//  String+Range.swift
//  StringUtilities
//
//  Created by Lluís Ulzurrun on 16/8/16.
//  Copyright © 2016 VisualNACert. All rights reserved.
//

import Foundation

public extension String {

    /**
     Returns a string object containing the characters of the String that lie
     within a given range.

     - note: Will return a string with a length of `endIndex - startIndex`
     characters

     - warning: Will crash if range include positions out of the string.

     - parameter range: Range of the string to be returned.

     - returns: Substring at given range.

     */
	public subscript(range: Range<Int>) -> String {

        precondition(
            range.lowerBound >= 0,
            "Cannot get substring starting from a < 0 index"
        )

		let start = self.characters.index(self.startIndex, offsetBy: range.lowerBound)

        precondition(
            start < self.endIndex,
            "Desired start index `\(start)` ≥ string length: `\(self.endIndex)`)"
        )

		let end = self.characters.index(start, offsetBy: range.upperBound - range.lowerBound)

        precondition(
            end <= self.endIndex,
            "Desired end index `\(end)` ≥ string length: `(\(self.endIndex)`)"
        )

		return self.substring(with: start..<end)
	}

}
