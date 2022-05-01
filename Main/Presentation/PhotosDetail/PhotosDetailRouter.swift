//
//  PhotosDetailRouter.swift
//  Main
//
//  Created by Özgün Ergen on 1.05.2022.


import UIKit

@objc protocol PhotosDetailRoutingLogic {
    
}

protocol PhotosDetailDataPassing {
    var dataStore: PhotosDetailDataStore? { get }
}

class PhotosDetailRouter: NSObject, PhotosDetailRoutingLogic, PhotosDetailDataPassing {
    weak var viewController: PhotosDetailViewController?
    var dataStore: PhotosDetailDataStore?

// MARK: Routing (navigating to other screens)

}
