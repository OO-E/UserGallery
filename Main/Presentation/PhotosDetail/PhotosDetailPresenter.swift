//
//  PhotosDetailPresenter.swift
//  Main
//
//  Created by Özgün Ergen on 1.05.2022.


import UIKit

protocol PhotosDetailPresentationLogic {
    func presentSomething(response: PhotosDetail.Response)
}

class PhotosDetailPresenter: PhotosDetailPresentationLogic {
    weak var viewController: PhotosDetailDisplayLogic?

    // MARK: Parse and calc respnse from PhotosDetailInteractor and send simple view model to PhotosDetailViewController to be displayed

    func presentSomething(response: PhotosDetail.Response) {
        let viewModel = PhotosDetail.ViewModel()
    }

}
