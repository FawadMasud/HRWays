//
//  TagsViewController.swift
//  NiceOne
//
//  Created by Fawad Masud on 01/01/2024.
//

import UIKit

class TagsViewController: UIViewController {

    let tagView = TagsView()
    override func viewDidLoad() {
        super.viewDidLoad()

        view = tagView
        title = "Brands"
    }
    
}
