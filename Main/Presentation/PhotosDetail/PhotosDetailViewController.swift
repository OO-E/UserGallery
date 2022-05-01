//
//  PhotosDetailViewController.swift
//  Main
//
//  Created by Özgün Ergen on 1.05.2022.



import UIKit

protocol PhotosDetailDisplayLogic: class
{
    
}

class PhotosDetailViewController: UIViewController, PhotosDetailDisplayLogic, StoryboardInstantiable {
    var interactor: PhotosDetailBusinessLogic?
    var router: (NSObjectProtocol & PhotosDetailRoutingLogic & PhotosDetailDataPassing)?

    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - Setup Clean Code Design Pattern 

    private func setup() {
        let viewController = self
        let interactor = PhotosDetailInteractor()
        let presenter = PhotosDetailPresenter()
        let router = PhotosDetailRouter()
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
        configure()
    }
    
    func configure() {
        
        imageView.fetch(url: self.router?.dataStore?.photoItem.thumbnailURL, placeholder: nil)
        
        let title = self.router?.dataStore?.photoItem.isFavorite == true ? "Favorited" : "UnFavorited"
        favoriteButton.setTitle(title, for: .normal)
    }
    
    
    //MARK: - receive events from UI
    
    @IBAction func tappedFavoriteButton(_ sender: Any) {
        
        interactor?.fetchFavorite()
        let title = self.router?.dataStore?.photoItem.isFavorite == true ? "Favorited" : "UnFavorited"
        favoriteButton.setTitle(title, for: .normal)
    }
    
    
    // MARK: - request data from PhotosDetailInteractor

    // MARK: - display view model from PhotosDetailPresenter

}
