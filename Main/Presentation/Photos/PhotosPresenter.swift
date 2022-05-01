//
//  PhotosPresenter.swift
//  Main
//
//  Created by Özgün Ergen on 30.04.2022.


import UIKit

protocol PhotosPresentationLogic {
    
    func success(response: Photos.Response)
    func fail(error: Photos.Error)
}

class PhotosPresenter: PhotosPresentationLogic {
    weak var viewController: PhotosDisplayLogic?

    // MARK: Parse and calc respnse from PhotosInteractor and send simple view model to PhotosViewController to be displayed

    func success(response: Photos.Response) {
       
        var snapshots = [Section<PhotosObject>]()
        response.userList.forEach { user in
            let title = user.username + " userID: \(user.id)"
            snapshots.append(Section.init(items: user.allPhotos ?? [], title: title ))
        }
        viewController?.success(viewModel: Photos.ViewModel(snapShot: snapshots))
    }
    
    func fail(error: Photos.Error) {
        viewController?.fail(error: error)
    }
}
