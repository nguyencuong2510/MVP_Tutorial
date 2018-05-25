//
//  ViewController.swift
//  MVP_Tutorial
//
//  Created by cuongnv on 5/25/18.
//  Copyright © 2018 cuongnv. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet var emptyView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let userPresenter = UserPresenter(userService: UserService())
    var usersToDisplay = [UserViewData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        activityIndicator.hidesWhenStopped = true
        
        userPresenter.attackView(view: self)
        userPresenter.getUsers()
    }
}

extension UserViewController: UserView {
    func startLoading() {
        activityIndicator.startAnimating()
    }
    
    func finishLoading() {
        activityIndicator.stopAnimating()
    }
    
    func setUsers(users: [UserViewData]) {
        usersToDisplay = users
        tableView.isHidden = false
        emptyView.isHidden = true
        tableView.reloadData()
    }
    
    func setEmptyUsers() {
        tableView.isHidden = true
        emptyView.isHidden = false
    }
}

extension UserViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = usersToDisplay[indexPath.row].name
        cell.detailTextLabel?.text = usersToDisplay[indexPath.row].age
        
        return cell
    }
}
