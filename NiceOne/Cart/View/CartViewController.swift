//
//  CartViewController.swift
//  NiceOne
//
//  Created by Fawad Masud on 01/01/2024.
//

import UIKit

class CartViewController: UIViewController {

    let cartView = CartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = cartView
        self.title = "Purse"
    }


}
