//
//  PhotosRepository.swift
//  Main
//
//  Created by Özgün Ergen on 1.05.2022.
//

import Foundation
import Networking

public typealias PhotosRepositoryHandler = (Result<[PhotosObject], RestClient.Error>) -> Void

public protocol PhotosRepositoryProtocol{
    func fetchAlbumList(albumID: String, handler: @escaping PhotosRepositoryHandler)
}

public class PhotosRepository: PhotosRepositoryProtocol {
    
    
    public func fetchAlbumList(albumID: String, handler: @escaping (Result<[PhotosObject], RestClient.Error>) -> Void) {
        let albumRequest = PhotosRequest(albumID: albumID)
        
        RestClient.default.makeRequest(request: albumRequest) {(_ response: [PhotosObject]?, error: RestClient.Error?) in
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
