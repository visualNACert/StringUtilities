//
//  String+Range.swift
//  Visual
//
//  Created by Lluís Ulzurrun on 16/8/16.
//  Copyright © 2016 VisualNACert. All rights reserved.
//

import Foundation

public extension String {

	public subscript(range: Range<Int>) -> String {
		let start = self.startIndex.advancedBy(range.startIndex)
		let end = start.advancedBy(range.endIndex - range.startIndex)
		return self.substringWithRange(start..<end)
	}

}