//
//  String+Remove.swift
//  StringUtilities
//
//  Created by Lluís Ulzurrun on 11/7/16.
//  Copyright © 2016 VisualNACert. All rights reserved.
//

import Foundation

public extension String {

	/**
	 Returns resulting string after removing occurrences of given substring from
     this string.

	 - parameter target: Substring to be removed from this string.

	 - returns: Resulting string.
	 */
	public func stringByRemoving(target: String) -> String {
		return self.stringByReplacingOccurrencesOfString(target, withString: "")
	}

	/**
	 Returns resulting string after removing occurrences of given substrings 
     from this string.

	 - parameter targets: Substrings to be removed from this string.

	 - returns: Resulting string.
	 */
    public func stringByRemoving<CS: CollectionType where CS.Generator.Element == String>(
        targets: CS
    ) -> String {
		return targets.reduce(self) { $0.stringByRemoving($1) }
	}

}
