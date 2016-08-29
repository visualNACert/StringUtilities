//
//  String+Trim.swift
//  Visual
//
//  Created by Lluís Ulzurrun on 5/8/16.
//  Copyright © 2016 VisualNACert. All rights reserved.
//

import Foundation

public extension String {

	/// Returns a trimmed version of this string.
	public var trimmedString: String {
		get {
			return self.stringByTrimmingCharactersInSet(
				NSCharacterSet.whitespaceAndNewlineCharacterSet()
			)
		}
	}

}