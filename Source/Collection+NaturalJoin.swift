//
//  Collection+NaturalJoin.swift
//  Pods
//
//  Created by Lluís Ulzurrun de Asanza Sàez on 2/1/17.
//
//

import Foundation

extension BidirectionalCollection where Iterator.Element == String, SubSequence.Iterator.Element == String {
    
    /**
     Returns elements of this collection joined using a separator between each 
     two elements. Last separator can be a different one.
     
     - note: Useful to create strings like: "One, two, three and four".
     
     - parameter separator: Separator to be used between each two elements but
     the last pair.
     - parameter lastItemSeparator: Separator to be used between last two 
     elements.
     
     - returns: String with this collection's elements joined.
     */
    func joined(separator: String, lastItemSeparator: String) -> String {
        
        guard let last = self.last else {
            return self.joined(separator: separator)
        }
        
        let allButLast = self.dropLast().joined(separator: separator)
        
        return "\(allButLast)\(lastItemSeparator)\(last)"
        
    }
    
}
