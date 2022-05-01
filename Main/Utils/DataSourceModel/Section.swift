//
//  Section.swift
//  DiffableDataSource
//
//  Created by James Rochabrun on 8/4/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import Foundation

struct Section<T: Hashable>: Hashable {
    let items: [T]
    let title: String?

}
