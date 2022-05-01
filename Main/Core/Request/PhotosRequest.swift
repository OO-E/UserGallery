//
//  PhotosRequest.swift
//  Main
//
//  Created by Özgün Ergen on 1.05.2022.
//


import Networking
import Foundation

struct PhotosRequest: GenericRequest, Encodable {
    
    var baseUrl: String? {
        BaseURL.Mock.url
    }
    
    var endpoint: String {
        Endpoint.Photos.url
    }
    
    var contentType: ContentType {
        .json
    }
    
    var method: RequestMethod {
        .get
    }
    var queryParameters: [URLQueryItem] {
        [
            URLQueryItem(name: "albumId", value: albumID)
        ]
    }
    private var albumID: String
    
    init(albumID: String) {
        self.albumID = albumID
    }
}
