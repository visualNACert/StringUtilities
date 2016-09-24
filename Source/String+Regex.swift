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
	fileprivate static var regexCache = [String: NSRegularExpression]()
    
    /// Clears cache of regular expressions.
    @available(*, introduced: 0.0.4)
    public static func clearRegexCache() {
        self.regexCache.removeAll()
    }
    

	/**
	 Returns matches for given regex in this string. First match returned will
     be the string matching given pattern.
     
     - note: Will cache expressions created.

	 - parameter pattern: Pattern to match in this string.

	 - throws: `NSError` if regex is malformed.

	 - returns: Matches for given regex in this string.
	 */
    @available(*, introduced: 0.0.4)
	public func matches(forPattern pattern: String) throws -> [String] {

		let regex: NSRegularExpression
		if let r = type(of: self).regexCache[pattern] {
			regex = r
		} else {
			regex = try NSRegularExpression(
                pattern: pattern,
                options: [.anchorsMatchLines, .caseInsensitive]
            )
			type(of: self).regexCache[pattern] = regex
		}

		let nsString = self as NSString

		let results = regex.matches(
			in: self,
			options: [],
			range: NSMakeRange(0, nsString.length)
		)

		return results.flatMap { result in
			(0..<result.numberOfRanges)
				.map { result.rangeAt($0) }
                .filter { $0.length > 0 }
				.map { nsString.substring(with: $0) }
		}

	}

}
