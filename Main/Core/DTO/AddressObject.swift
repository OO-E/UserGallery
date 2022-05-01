//
//  AdressObject.swift
//  Core
//
//  Created by Özgün Ergen on 1.05.2022.
//

import UIKit
// MARK: - Address

public struct AddressObject: Codable {
    let street, suite, city, zipcode: String
    let geo: GeoObject
}
