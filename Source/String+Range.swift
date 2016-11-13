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
		let start = self.characters.index(self.startIndex, offsetBy: range.lowerBound)
		let end = self.characters.index(start, offsetBy: range.upperBound - range.lowerBound)
		return self.substring(with: start..<end)
	}

}
