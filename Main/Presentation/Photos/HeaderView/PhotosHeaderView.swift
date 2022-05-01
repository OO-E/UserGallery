//
//  PhotosHeaderView.swift
//  Main
//
//  Created by Özgün Ergen on 30.04.2022.
//

import UIKit

class PhotosHeaderView: UICollectionReusableView {

    @IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setTitle(title: String) {
        label.text = title
    }
}
