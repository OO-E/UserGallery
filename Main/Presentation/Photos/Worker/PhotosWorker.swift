//
//  PhotosWorker.swift
//  Main
//
//  Created by Özgün Ergen on 30.04.2022.


import UIKit

class PhotosWorker {
   
    private var photosRepository = PhotosRepository()
    
    
    func fetchUserPhotos(albumID: String, handler: @escaping PhotosRepositoryHandler) {
        photosRepository.fetchAlbumList(albumID: albumID) { result in
            handler(result)
        }
    }
    
    func fetchFavoritedPhotosList() -> [String] {
        
        return CacheHelper.getPhotoID()
    }
}
