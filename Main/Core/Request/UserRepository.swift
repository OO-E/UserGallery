//
//  UserRepository.swift
//  Core
//
//  Created by Özgün Ergen on 1.05.2022.
//


import Networking
import Foundation

public typealias UserRepositoryHandler = (Result<[UserObject], RestClient.Error>) -> Void

public protocol UserRepositoryProtocol{
    func fetchUserList(handler: @escaping UserRepositoryHandler)
}

public class UserRepository: UserRepositoryProtocol {
    
    public func fetchUserList(handler: @escaping (Result<[UserObject], RestClient.Error>) -> Void) {
        let userRequest = UserRequest()
        RestClient.default.makeRequest(request: userRequest) {(_ response: [UserObject]?, error: RestClient.Error?) in
            if let _error = error {
                handler(.failure(_error))
                return
            }else if let _response = response {
                handler(.success(_response))
                return
            }
        }
    }
}
