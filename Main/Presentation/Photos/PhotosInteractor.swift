//
//  PhotosInteractor.swift
//  Main
//
//  Created by Özgün Ergen on 30.04.2022.


import UIKit

protocol PhotosBusinessLogic {
    func fetchUsers()
    func fetchPhotos()
}

protocol PhotosDataStore {
    var userList: [UserObject]? {get set}
}

class PhotosInteractor: PhotosBusinessLogic, PhotosDataStore {
    
    var presenter: PhotosPresentationLogic?
    var photosWorker: PhotosWorker?
    var userWorker: UserWorker?
    let group = DispatchGroup()
    
    var userList: [UserObject]?
    
    init() {
        userWorker = UserWorker()
        photosWorker = PhotosWorker()
    }
    
    // MARK: Do something (and send response to PhotosPresenter)
    
    func fetchUsers() {
        
        group.enter()
        userWorker?.fetchUserList(handler: { result in
            
            switch result {
            case.success(let userList):
                self.userList = userList
                self.fetchAlbums()
            case .failure(let error):
                self.presenter?.fail(error: Photos.Error(message: error.localizedDescription))
                break
            }
            self.group.leave()
        })
        
        group.notify(queue: DispatchQueue.global()) {
            
            self.presenter?.success(response: Photos.Response(userList: self.userList))
            print("Successs User Albums ")
        }
        
    }
    
    func fetchPhotos() {
        let photosIDList = photosWorker?.fetchFavoritedPhotosList()
        print("PHOTO SAVED LIST")
        print(photosIDList)
        fetchUsers()
    }
    
    private func fetchAlbums() {
        
        for (index, user) in userList!.enumerated() {
            group.enter()
            userWorker?.fetchAlbumList(userId: "\(user.id)", handler: { result in
                switch result {
                case .success(let album):
                    self.userList![index].albums = album
                    album.forEach { item in
                        self.fetchPhotos(albumID: "\(item.id)", index: index)
                    }
                    break
                case .failure(_):
                    break
                }
                self.group.leave()
            })
        }
    }
    
    private func fetchPhotos(albumID: String, index: Int) {
        
        group.enter()
        photosWorker?.fetchUserPhotos(albumID: albumID, handler: { result in
            switch result {
            case .success(let photos):
            
                if self.userList![index].allPhotos == nil {
                    self.userList![index].allPhotos = []
                }
                
                self.userList![index].allPhotos! += photos
                
                for (pIndex, photo) in self.userList![index].allPhotos!.enumerated() {
                   
                    self.userList![index].allPhotos![pIndex].userID = "\(self.userList![index].id)"
                    self.userList![index].allPhotos![pIndex].isFavorite = CacheHelper.find(photo: "\(photo.id)")
                    
                }
                
                break
            case .failure(_): break
            }
            self.group.leave()
        })
        
        
        
    }
    
}
