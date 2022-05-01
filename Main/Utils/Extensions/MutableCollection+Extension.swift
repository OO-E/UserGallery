//
//  MutableCollection+Extension.swift
//  Main
//
//  Created by Özgün Ergen on 1.05.2022.
//

import Foundation

extension MutableCollection {
    mutating func mutableMap(_ transform: (Element) throws -> Element) rethrows {
        var index = startIndex
        for element in self {
            self[index] = try transform(element)
            formIndex(after: &index)
        }
    }
}

