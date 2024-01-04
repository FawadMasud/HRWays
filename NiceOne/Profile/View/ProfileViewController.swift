//
//  ProfileViewController.swift
//  NiceOne
//
//  Created by Fawad Masud on 01/01/2024.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = profileView
        self.title = "Profile"
    }
    
    
}
