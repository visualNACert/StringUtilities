//
//  String+Regex.swift
//  StringUtilities
//
//  Created by Lluís Ulzurrun on 6/7/16.
//  Copyright © 2016 VisualNACert. All rights reserved.
//

import Foundation

public extension String {
    
	/// Cache of regular expressions created.
	private static var regexCache = [String: NSRegularExpression]()
    
    /// Clears cache of regular expressions.
    public func clearRegexCache() {
        self.dynamicType.regexCache.removeAll()
    }

	/**
	 Returns matches for given regex in this string. First match returned will
     be the string matching given pattern.
     
     - note: Will cache expressions created.

	 - parameter pattern: Pattern to match in this string.

	 - throws: `NSError` if regex is malformed.

	 - returns: Matches for given regex in this string.
	 */
	public func matchesForRegex(pattern: String) throws -> [String] {

		let regex: NSRegularExpression
		if let r = self.dynamicType.regexCache[pattern] {
			regex = r
		} else {
			regex = try NSRegularExpression(
                pattern: pattern,
                options: [.AnchorsMatchLines, .CaseInsensitive]
            )
			self.dynamicType.regexCache[pattern] = regex
		}

		let nsString = self as NSString

		let results = regex.matchesInString(
			self,
			options: [],
			range: NSMakeRange(0, nsString.length)
		)

		return results.flatMap { result in
			(0..<result.numberOfRanges)
				.map { result.rangeAtIndex($0) }
                .filter { $0.length > 0 }
				.map { nsString.substringWithRange($0) }
		}

	}

}
