//
//  String+Trim.swift
//  StringUtilities
//
//  Created by Lluís Ulzurrun on 5/8/16.
//  Copyright © 2016 VisualNACert. All rights reserved.
//

import Foundation

public extension String {

	/// Returns a copy of this string, with leading and trailing whitespace 
    /// omitted.
	public func trimmedString() -> String {
        #if swift(>=3)
        return self.trimmingCharacters(
            in: CharacterSet.whitespacesAndNewlines
        )
        #else
        return self.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        #endif
	}

}
