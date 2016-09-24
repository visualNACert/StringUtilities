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
    #if swift(>=3)
    @available(*, introduced: 0.0.4)
    public func removingOccurrences(of target: String) -> String {
        return self.replacingOccurrences(of: target, with: "")
    }
    @available(*, deprecated: 0.0.4, renamed: "removingOccurrences(of:)")
	public func stringByRemoving(_ target: String) -> String {
		return self.removingOccurrences(of: target)
	}
    #else
    public func stringByRemoving(target: String) -> String {
        return self.stringByReplacingOccurrencesOfString(target, withString: "")
    }
    #endif

	/**
	 Returns resulting string after removing occurrences of given substrings 
     from this string.

	 - parameter targets: Substrings to be removed from this string.

	 - returns: Resulting string.
	 */
    #if swift(>=3)
    @available(*, introduced: 0.0.4)
    public func removingOccurrences<CS: Collection>(of targets: CS) -> String
    where CS.Iterator.Element == String {
        return targets.reduce(self) { $0.removingOccurrences(of: $1) }
    }
    @available(*, deprecated: 0.0.4, renamed: "removingOccurrences(of:)")
    public func stringByRemoving<CS: Collection>(
        _ targets: CS
    ) -> String where CS.Iterator.Element == String {
        return self.removingOccurrences(of: targets)
	}
    #else
    public func stringByRemoving<CS: CollectionType where CS.Generator.Element == String>(
    targets: CS
    ) -> String {
        return targets.reduce(self) { $0.stringByRemoving($1) }
    }
    #endif

}
