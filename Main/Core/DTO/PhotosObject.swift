//
//  PhotosObject.swift
//  Main
//
//  Created by Özgün Ergen on 1.05.2022.
//

import Foundation


public struct PhotosObject: Codable, Hashable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String
    var userID: String?
    var isFavorite: Bool = false

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
        
    }
}
