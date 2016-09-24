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
            range.startIndex >= 0,
            "Cannot get substring starting from a < 0 index"
        )
		let start = self.startIndex.advancedBy(range.startIndex)
        precondition(
            start < self.endIndex,
            "Desired start index `\(start)` ≥ string length: `\(self.endIndex)`)"
        )
		let end = start.advancedBy(range.endIndex - range.startIndex)
        precondition(
            end <= self.endIndex,
            "Desired end index `\(end)` ≥ string length: `(\(self.endIndex)`)"
        )
		return self.substringWithRange(start..<end)
	}

}
