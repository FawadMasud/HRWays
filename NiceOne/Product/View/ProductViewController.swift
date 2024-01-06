//
//  ProductViewController.swift
//  NiceOne
//
//  Created by Fawad Masud on 01/01/2024.
//

import UIKit
import Localize_Swift

class ProductViewController: UIViewController {

    let productView = ProductView()
    override func viewDidLoad() {
        super.viewDidLoad()

        view = productView
        title = "Products".localized()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
