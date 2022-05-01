//
//  AlbumObject.swift
//  Main
//
//  Created by Özgün Ergen on 1.05.2022.
//

import Foundation


public struct AlbumObject: Codable {
    let userID, id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}
