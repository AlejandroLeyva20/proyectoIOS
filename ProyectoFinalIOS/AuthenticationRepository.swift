//
//  AuthenticationRepository.swift
//  Login
//
//  Created by user217673 on 6/16/22.
//

import Foundation

final class AuthenticationRepository {
    private let authenticationFirebaseDatasource: AuthenticationFirebaseDatasource
    
    init(authenticationFirebaseDatasource: AuthenticationFirebaseDatasource = AuthenticationFirebaseDatasource()) {
        self.authenticationFirebaseDatasource = authenticationFirebaseDatasource
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        authenticationFirebaseDatasource.createNewUser(email: email,
                                                       password: password,
                                                       completionBlock: completionBlock)
    }
    
    func getCurrentUser() -> User? {
           authenticationFirebaseDatasource.getCurrentUser()
       }
    
    func logout() throws {
            try authenticationFirebaseDatasource.logout()
        }
    
    func login(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
            authenticationFirebaseDatasource.login(email: email,
                                                   password: password,
                                                   completionBlock: completionBlock)
        }
    
}
