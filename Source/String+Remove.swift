//
//  String+Remove.swift
//  Visual
//
//  Created by Lluís Ulzurrun on 11/7/16.
//  Copyright © 2016 VisualNACert. All rights reserved.
//

import Foundation

public extension String {

	/**
	 Returns resulting stirng of removing occurrences of given string from this
	 string.

	 - parameter target: String to be removed from this string.

	 - returns: Resulting string.
	 */
	public func removing(_ target: String) -> String {
		return self.replacingOccurrences(of: target, with: "")
	}

	/**
	 Returns resulting stirng of removing occurrences of given strings from this
	 string.

	 - parameter targets: Strings to be removed from this string.

	 - returns: Resulting string.
	 */
	public func removing(_ targets: [String]) -> String {
		return targets.reduce(self) { $0.removing($1) }
	}

}
