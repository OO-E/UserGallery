//
//  AlbumRepository.swift
//  Main
//
//  Created by Özgün Ergen on 1.05.2022.
//

import Foundation
import Networking

public typealias AlbumRepositoryHandler = (Result<[AlbumObject], RestClient.Error>) -> Void

public protocol AlbumRepositoryProtocol{
    func fetchAlbumList(userID: String, handler: @escaping AlbumRepositoryHandler)
}

public class AlbumRepository: AlbumRepositoryProtocol {
    
    
    public func fetchAlbumList(userID: String, handler: @escaping (Result<[AlbumObject], RestClient.Error>) -> Void) {
        let albumRequest = AlbumRequest(userID: userID)
        
        RestClient.default.makeRequest(request: albumRequest) {(_ response: [AlbumObject]?, error: RestClient.Error?) in
            if let _error = error {
                handler(.failure(_error))
                return
            }else if let _response = response {
                handler(.success(_response))
                return
            }
        }
    }
}
