//
//  PhotosCell.swift
//  Main
//
//  Created by Özgün Ergen on 30.04.2022.
//

import UIKit

class PhotosCell: UICollectionViewCell {

    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var photoIDLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(item: PhotosObject) {
        favoriteImageView.image = item.isFavorite == false ? UIImage(systemName: "star") : UIImage(systemName: "star.fill")
        imageView.fetch(url: item.thumbnailURL, placeholder: nil)
        photoIDLabel.text = "PhotoID: \(item.id ) AlbumID: \(item.albumID)"
        userIDLabel.text = "UserID: \(item.userID!)"
    }
}
