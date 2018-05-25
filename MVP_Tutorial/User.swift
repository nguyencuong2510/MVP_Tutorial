//
//  User.swift
//  MVP_Tutorial
//
//  Created by cuongnv on 5/25/18.
//  Copyright © 2018 cuongnv. All rights reserved.
//

import Foundation

struct User {
    let firstName: String
    let lastName: String
    let email: String
    let age: Int
}

class UserService {
    func getUser(callBack: @escaping ([User]) -> Void) {
        let users = [User(firstName: "name1", lastName: "lastname1", email: "name1@gmail.com", age: 18),
                     User(firstName: "name2", lastName: "lastname2", email: "name2@gmail.com", age: 19),
                     User(firstName: "name3", lastName: "lastname3", email: "name3@gmail.com", age: 20),
                     User(firstName: "name4", lastName: "lastname4", email: "name4@gmail.com", age: 21)
                     ]
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            callBack(users)
        }
    }
}
