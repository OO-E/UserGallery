//
//  UIImageView+Extension.swift
//  Main
//
//  Created by Özgün Ergen on 1.05.2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func fetch(url: String?, placeholder: UIImage?) {
        if let _url = url {
            self.kf.setImage(with: URL(string: _url))
        } else {
            self.image = placeholder
        }
    }
}
