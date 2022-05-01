//
//  AlbumRequest.swift
//  Main
//
//  Created by Özgün Ergen on 1.05.2022.
//


import Networking
import Foundation

struct AlbumRequest: GenericRequest, Encodable {
    
    var baseUrl: String? {
        BaseURL.Mock.url
    }
    
    var endpoint: String {
        Endpoint.Album.url
    }
    
    var contentType: ContentType {
        .json
    }
    
    var method: RequestMethod {
        .get
    }
    var queryParameters: [URLQueryItem] {
        [
            URLQueryItem(name: "userId", value: userID)
        ]
    }
    private var userID: String
    
    init(userID: String) {
        self.userID = userID
    }
}
