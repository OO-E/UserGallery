//
//  PhotosViewController.swift
//  Main
//
//  Created by Özgün Ergen on 30.04.2022.


import UIKit

protocol PhotosDisplayLogic: class
{
    func success(viewModel: Photos.ViewModel)
    func fail(error: Photos.Error)
    
}

class PhotosViewController: UIViewController, PhotosDisplayLogic, StoryboardInstantiable {
    
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.registerNib(witClassAndIdentifier: PhotosCell.self)
            collectionView.registerHeader(witClassAndIdentifier: PhotosHeaderView.self)
            collectionView.delegate = self
            collectionViewModel = PhotosCollectionViewModel(collectionView: collectionView)
            }
    }
    
    var collectionViewModel: PhotosCollectionViewModel!
    var interactor: PhotosBusinessLogic!
    var router: (NSObjectProtocol & PhotosRoutingLogic & PhotosDataPassing)!
    
    // MARK: - Setup Clean Code Design Pattern
    private func setup() {
        let viewController = self
        let interactor = PhotosInteractor()
        let presenter = PhotosPresenter()
        let router = PhotosRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup()
        fetchUser()
    }
    
    //MARK: - receive events from UI
    
    // MARK: - request data from PhotosInteractor
    func fetchUser() {
        self.showLoader()
        interactor.fetchUsers()
    }
    
    // MARK: - display view model from PhotosPresenter
    func success(viewModel: Photos.ViewModel) {
        self.dismissLoader()
        collectionViewModel.createSnapshot(sectionsList: viewModel.snapShot)
    }
    
    func fail(error: Photos.Error) {
        self.dismissLoader()
        self.showMessage(title: "", message: error.message)
        
    }
    
}

//MARK: - CollectionView Delegate
extension PhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let item = collectionViewModel.dataSource?.itemIdentifier(for: indexPath),
           let userID = item.userID,
           let user =  router.dataStore?.userList?.filter({ $0.id == Int(userID)}) {
               
               print("user name ",user.first?.name)
            self.router.pushDetail(photoItem: item)
            
        }
        
        
    }
}

//MARK: - ControllerDelegate
extension PhotosViewController: ControllerDelegate {
    func reloadView() {
        self.interactor.fetchPhotos()
    }
}
