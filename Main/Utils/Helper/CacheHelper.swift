//
//  CacheHelper.swift
//  Main
//
//  Created by Özgün Ergen on 1.05.2022.
//


import UIKit

class CacheHelper: NSObject {
    
    fileprivate static let SavedIDs = "UserDefaultsSavedPhotoID"
    
    static func save(photo: String?) {
        guard let photo = photo else {
            return
        }
        var savedIDs = CacheHelper.getPhotoID()
        savedIDs.append(photo)
        let userDefaults = UserDefaults.standard
        userDefaults.set(savedIDs, forKey: SavedIDs)
    }
    
    static func remove(photo: String?) {
        guard let photo = photo else {
            return
        }
        var savedIDs = CacheHelper.getPhotoID()
        guard let findIndex = savedIDs.firstIndex(of: photo) else { return  }
        savedIDs.remove(at: findIndex)
        let userDefaults = UserDefaults.standard
        userDefaults.set(savedIDs, forKey: SavedIDs)
    }
    
    static func getPhotoID() -> [String] {
        return UserDefaults.standard.object(forKey: SavedIDs) as? [String] ?? []
    }
    
    static func find(photo: String?) -> Bool {
        guard let photo = photo else {
            return false
        }
        let savedIDs = CacheHelper.getPhotoID()
        return savedIDs.contains(photo)
    }
}
