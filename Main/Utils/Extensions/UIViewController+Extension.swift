//
//  UIViewController+Extension.swift
//  Main
//
//  Created by Özgün Ergen on 30.04.2022.
//

import UIKit


extension UIViewController {
    
    func showLoader() {
        Loader.show()
    }
    
    func dismissLoader() {
        Loader.dismiss()
    }
    
    func showMessage(title: String, message: String) {
        mainThread {
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
    }
}
