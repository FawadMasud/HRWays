//
//  HomeViewModel.swift
//  NiceOne
//
//  Created by Fawad Masud on 02/01/2024.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    
    func didReceiveData()
    func didReceiveCartProducts(products:[Products])
    func didReceiveRecommendedProducts(products:[Products])
    func didFailToGetData()
}

final class HomeViewModel {
    
    weak var delegate: HomeViewModelProtocol?
    
    var cartProducts = [Products]()
    var campaingProducts = [Products]()
    
    func fetchAllData(){
        
        let service = WebService()
        
        service.getCartDataOffline(completion: {cartData,recommended,error  in
            
            print(cartData)
            
            self.delegate?.didReceiveCartProducts(products: cartData)
            self.delegate?.didReceiveRecommendedProducts(products: recommended)
        })
    }
}
