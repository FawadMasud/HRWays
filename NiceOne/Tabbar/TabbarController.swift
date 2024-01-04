//
//  TabbarController.swift
//  NiceOne
//
//  Created by Fawad Masud on 01/01/2024.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        configureTabBar()
        // Do any additional setup after loading the view.
        
        self.tabBar.isUserInteractionEnabled = true
        self.tabBar.tintColor = .black
    }
    

    func setupTabBar() {
        let viewControllers = [homeViewController(), productViewController(),brandsViewController(), cartViewController(), profileViewController()]
        setViewControllers(viewControllers, animated: true)
    }
    
    
    private func configureTabBar() {
        tabBar.itemPositioning = .fill
        tabBar.barTintColor = .systemGray5
       // tabBar.tintColor = .mainAppColor
    }

    private func homeViewController() -> UINavigationController {
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: "Home",
                                         image: UIImage(systemName: "house"),
                                         selectedImage: UIImage(systemName: "house.fill"))
        return UINavigationController(rootViewController: homeVC)
    }
    
    private func productViewController() -> UINavigationController {
        let productVC = ProductViewController()
        productVC.tabBarItem = UITabBarItem(title: "Products",
                                                image: UIImage(systemName: "list.bullet"),
                                                selectedImage: UIImage(systemName: "list.bullet"))
        return UINavigationController(rootViewController: productVC)
    }
    
    private func brandsViewController() -> UINavigationController {
        let tagsVC = TagsViewController()
        tagsVC.tabBarItem = UITabBarItem(title: "Brands",
                                         image: UIImage(systemName: "tag"),
                                         selectedImage: UIImage(systemName: "tag.fill" ))
        return UINavigationController(rootViewController: tagsVC)
    }
    
    private func cartViewController() -> UINavigationController {
        let cartVC = CartViewController()
        cartVC.tabBarItem = UITabBarItem(title: "Purse",
                                         image: UIImage(systemName: "bag"),
                                         selectedImage: UIImage(systemName: "bag.fill" ))
        return UINavigationController(rootViewController: cartVC)
    }
    
    private func profileViewController() -> UINavigationController {
        let profileVC = ProfileViewController()
        profileVC.tabBarItem = UITabBarItem(title: "Profile",
                                            image: UIImage(systemName: "person" ),
                                            selectedImage: UIImage(systemName: "person.fill"))
        return UINavigationController(rootViewController: profileVC)
    }
}
