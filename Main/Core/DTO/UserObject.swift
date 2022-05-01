//
//  UserModel.swift
//  Core
//
//  Created by Özgün Ergen on 1.05.2022.
//

import UIKit

// MARK: - ConfigurationLinesItemElement

public struct UserObject: Codable {
    let id: Int
    let name, username, email: String
    let address: AddressObject
    let phone, website: String
    let company: CompanyObject
    var albums: [AlbumObject]?
    var allPhotos: [PhotosObject]?
}

