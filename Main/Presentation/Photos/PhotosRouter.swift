//
//  PhotosRouter.swift
//  Main
//
//  Created by Özgün Ergen on 30.04.2022.


import UIKit

protocol PhotosRoutingLogic {
    func pushDetail(photoItem: PhotosObject)
}

protocol PhotosDataPassing {
    var dataStore: PhotosDataStore? { get }
}

class PhotosRouter: NSObject, PhotosRoutingLogic, PhotosDataPassing {
    weak var viewController: PhotosViewController?
    var dataStore: PhotosDataStore?
    
    
    func pushDetail(photoItem: PhotosObject) {
        
        let photoDetail = PhotosDetailViewController.instantiateViewController()
        photoDetail.interactor?.setPhotoItem(photoItem: photoItem)
        photoDetail.interactor?.setDelegate(delegate: viewController as! ControllerDelegate)
        viewController?.navigationController?.pushViewController(photoDetail, animated: true)
        
    }
}
