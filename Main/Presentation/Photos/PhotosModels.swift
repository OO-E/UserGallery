//
//  PhotosModels.swift
//  Main
//
//  Created by Özgün Ergen on 30.04.2022.


import UIKit

enum Photos
{
    // MARK: Use cases
    struct Response
    {
        var userList: [UserObject]!
    }
  
    
    struct ViewModel
    {
        var snapShot: [Section<PhotosObject>]!
    }
    
    struct Error {
        var message: String!
    }
  
}
