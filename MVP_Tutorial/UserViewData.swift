//
//  UserViewData.swift
//  MVP_Tutorial
//
//  Created by cuongnv on 5/25/18.
//  Copyright © 2018 cuongnv. All rights reserved.
//

import Foundation

struct UserViewData {
    let name: String
    let age: String
}

protocol UserView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setUsers(users: [UserViewData])
    func setEmptyUsers()
}
