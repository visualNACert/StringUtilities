//
//  Collection+NaturalJoin.swift
//  StringUtilities
//
//  Created by Lluís Ulzurrun de Asanza Sàez on 2/1/17.
//
//

import Foundation

extension BidirectionalCollection
where Iterator.Element == String, SubSequence.Iterator.Element == String {

    /**
     Returns elements of this collection joined using a separator between each
     two elements. Last separator can be a different one.

     - note: Useful to create strings like: "One, two, three and four".

     - parameter separator: Separator to be used between each two elements but
     the last pair.
     - parameter lastElementSeparator: Separator to be used between last two
     elements.

     - returns: String with this collection's elements joined.
     */
    public func joined(
        separator: String,
        lastElementSeparator: String
    ) -> String {

        guard let last = self.last, self.count > 1 else {
            return self.joined(separator: separator)
        }

        let allButLast = self.dropLast().joined(separator: separator)

        return [allButLast, lastElementSeparator, last].joined()

    }

}
