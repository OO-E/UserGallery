//
//  UserRequest.swift
//  Core
//
//  Created by Özgün Ergen on 1.05.2022.
//

import Networking
import Foundation

struct UserRequest: GenericRequest, Encodable {
    
    var baseUrl: String? {
        BaseURL.Mock.url
    }
    
    var endpoint: String {
        Endpoint.User.url
    }
    
    var contentType: ContentType {
        .json
    }
    
    var method: RequestMethod {
        .get
    }
}
