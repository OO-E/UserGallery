//
//  UICollectionView+Extension.swift
//  Main
//
//  Created by Özgün Ergen on 30.04.2022.
//

import UIKit

extension UICollectionView {
    
    func registerNib<T>(witClassAndIdentifier:T.Type) {
        
        self.register(UINib.init(nibName: String(describing: T.self), bundle: nil), forCellWithReuseIdentifier: String(describing: T.self))
    }
    
    func registerHeader<T>(witClassAndIdentifier:T.Type) {
        
        
        self.register(UINib.init(nibName: String(describing: T.self), bundle: nil),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier:  String(describing: T.self))
        
        
    }
    
    func dequeueCell<T>(withClassAndIdentifier classAndIdentifier: T.Type, for indexPath: IndexPath) -> T {
        
        return self.dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }
    
    
    
    func dequeueHeader<T>(withClassAndIdentifier classAndIdentifier: T.Type, for indexPath: IndexPath) -> T {
    
        return self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                     withReuseIdentifier: String(describing: T.self),
                                                     for: indexPath) as! T
        
    }
    

}
