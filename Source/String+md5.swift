//
//  String+md5.swift
//  Visual
//
//  Created by Lluís Ulzurrun on 4/7/16.
//  Copyright © 2016 VisualNACert. All rights reserved.
//

import Foundation
import CommonCrypto

public extension String {

	/// `md5` hash of this string.
	public var md5: String {
		get {

			var digest = [UInt8](
				count: Int(CC_MD5_DIGEST_LENGTH),
				repeatedValue: 0
			)

			if let data = self.dataUsingEncoding(NSUTF8StringEncoding) {
				CC_MD5(data.bytes, CC_LONG(data.length), &digest)
			}

			var digestHex = ""
			for index in 0..<Int(CC_MD5_DIGEST_LENGTH) {
				digestHex += String(format: "%02x", digest[index])
			}

			return digestHex

		}
	}

}

