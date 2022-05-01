//
//  UserWorker.swift
//  Main
//
//  Created by Özgün Ergen on 1.05.2022.
//


import UIKit

class UserWorker {
    
    private var userRepository = UserRepository()
    private var albumRepository = AlbumRepository()
    
    func fetchUserList(handler: @escaping UserRepositoryHandler) {
        userRepository.fetchUserList { result in
            handler(result)
        }
    }

    func fetchAlbumList(userId: String, handler: @escaping AlbumRepositoryHandler) {
        
        albumRepository.fetchAlbumList(userID: userId, handler: { result in
            handler(result)
        }) 
    }
    
}
