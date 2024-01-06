//
//  HomeViewController.swift
//  NiceOne
//
//  Created by Fawad Masud on 01/01/2024.
//

import UIKit
import MOLH
import Localize_Swift

class HomeViewController: UIViewController {

    let homeView = HomeView()
    
    var products:[Products] = []
    var recommended:[Products] = []
    
    private let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = homeView
        self.title = "Home".localized()
        view.isUserInteractionEnabled = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "share"), style: .plain, target: self, action: #selector(shareTapped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Language".localized(), style: .plain, target: self, action: #selector(languageTapped))
        
        homeView.btnCheckout.addTarget(self, action: #selector(checkoutClicked) , for: .touchUpInside)
        
        setupTableViewDelegate()
        setupDelegate()
        self.navigationController?.navigationBar.tintColor = .black
        
        homeViewModel.delegate = self
        
        homeViewModel.fetchAllData()
    }
    
    @objc func shareTapped(){
        
    }
    
    @objc func languageTapped(){
        
        let alert = UIAlertController(title: "Language".localized(), message: "Please select language".localized(), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "English".localized(), style: .default, handler: {_ in
            MOLH.setLanguageTo("en")
            Localize.setCurrentLanguage("en")
            UserDefaults.standard.setValue("en", forKey: LANGUAGE)
            self.reloadApp()
        }))
        alert.addAction(UIAlertAction(title: "Arabic".localized(), style: .default, handler: {_ in
            MOLH.setLanguageTo("ar")
            Localize.setCurrentLanguage("ar")
            UserDefaults.standard.setValue("ar", forKey: LANGUAGE)
            self.reloadApp()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func checkoutClicked(){
        
        let alert = UIAlertController(title: "Alert", message: "Please add address", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style:.default))
        self.present(alert, animated: true, completion: nil)
    }

    func reloadApp(){
        
        let sceneDelegate = UIApplication.shared.connectedScenes
                .first!.delegate as! SceneDelegate
        let tabBar = TabbarController()
        sceneDelegate.window?.rootViewController = tabBar
    }
}

// MARK: - HomeViewModel Methods

extension HomeViewController:HomeViewModelDelegate {
    
    func didReceiveData(cartInfo:Cart) {
        
        homeView.lblFreeShipping.text = cartInfo.offer?.attributedHtmlString?.string
        homeView.lblCheckout.text = cartInfo.total
        
    }
    
    func didReceiveCartProducts(products: [Products]) {
        
        self.products = products
        homeView.tblCart.reloadData()
    }
    
    func didReceiveRecommendedProducts(products: [Products]) {
        
        
        recommended = products
        homeView.collectionSuggestion.reloadData()
    }
    
    func didFailToGetData(message:String) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style:.default))
        self.present(alert, animated: true, completion: nil)
    }
}


// MARK: - UITableView Methods
extension HomeViewController: UITableViewDelegate, UITableViewDataSource,CartCellDelegate {
    
    
    private func setupTableViewDelegate() {
        homeView.tblCart.delegate = self
        homeView.tblCart.dataSource = self
        homeView.tblCart.register(CartCell.self, forCellReuseIdentifier: CartCell.identifier)
        homeView.tblCart.rowHeight = 110
        homeView.tblCart.separatorStyle = .singleLine
        homeView.tblCart.isUserInteractionEnabled = true
        homeView.tblCart.isScrollEnabled = true
        homeView.tblCart.allowsSelection = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeView.tblCart.dequeueReusableCell(withIdentifier: CartCell.identifier, for: indexPath) as! CartCell
        cell.configure(data:products[indexPath.row])
        cell.delegate = self
        cell.tag = indexPath.row
       // cell.start()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func didDeleteObjectFromCart(index:Int) {
        products.remove(at: index)
        homeView.tblCart.reloadData()
    }
}

 //MARK: - CollectionView Methods
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,SuggestionCellDelegate {
    
    private func setupDelegate() {
        homeView.collectionSuggestion.delegate = self
        homeView.collectionSuggestion.dataSource = self
        homeView.collectionSuggestion.register(SuggestionCell.self, forCellWithReuseIdentifier:SuggestionCell.identifier)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return recommended.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = homeView.collectionSuggestion.dequeueReusableCell(withReuseIdentifier: SuggestionCell.identifier, for: indexPath) as? SuggestionCell else { return UICollectionViewCell()}
        cell.delegate = self
     //   self.homeViewModel.fetchFavList()
        cell.configure(data: recommended[indexPath.row] )
        cell.configure()
        return cell
            
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: homeView.collectionSuggestion.frame.width / 2.8, height: homeView.collectionSuggestion.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
            return 5
    }
    
    func addObjectInCart(product: Products) {
        
        products.append(product)
        homeView.tblCart.reloadData()
    }
}
