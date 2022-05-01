//
//  PhotosDetailInteractor.swift
//  Main
//
//  Created by Özgün Ergen on 1.05.2022.


import UIKit

protocol PhotosDetailBusinessLogic {

    func setPhotoItem(photoItem: PhotosObject)
    func setDelegate(delegate: ControllerDelegate)
    func fetchFavorite()

}

protocol PhotosDetailDataStore {
    
    
    var photoItem: PhotosObject! { get set }
    var delegate: ControllerDelegate? { get set }
}

class PhotosDetailInteractor: PhotosDetailBusinessLogic, PhotosDetailDataStore {
    
    var photoItem: PhotosObject!
    var presenter: PhotosDetailPresentationLogic?
    var worker: PhotosDetailWorker?
    var delegate: ControllerDelegate?

    func setPhotoItem(photoItem: PhotosObject) {
        self.photoItem = photoItem
    }
    
    func setDelegate(delegate: ControllerDelegate) {
        self.delegate = delegate
    }
    
    // MARK: Do something (and send response to PhotosDetailPresenter)

    func fetchFavorite() {
        self.photoItem.isFavorite = !self.photoItem.isFavorite
        if self.photoItem.isFavorite {
            CacheHelper.save(photo: "\(photoItem.id)")
        } else {
            CacheHelper.remove(photo: "\(photoItem.id)")
        }
        self.delegate?.reloadView()
        
    }
}
