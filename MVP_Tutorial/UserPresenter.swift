//
//  UserPresenter.swift
//  MVP_Tutorial
//
//  Created by cuongnv on 5/25/18.
//  Copyright © 2018 cuongnv. All rights reserved.
//

import Foundation

class UserPresenter {
    private let userService: UserService
    weak private var userView: UserView?
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func attackView(view: UserView) {
        userView = view
    }
    
    func getUsers() {
        self.userView?.startLoading()
        userService.getUser { [weak self] users in
            self?.userView?.finishLoading()
            if users.count == 0 {
                self?.userView?.setEmptyUsers()
            }else {
                let mappedUsers: [UserViewData] = users.map {
                    return UserViewData(name: "\($0.firstName) \($0.lastName)", age: "\($0.age) years")
                }
                self?.userView?.setUsers(users: mappedUsers)
            }
        }
    }
    
}
