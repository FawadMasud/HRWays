//
//  HomeViewModel.swift
//  NiceOne
//
//  Created by Fawad Masud on 02/01/2024.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    
    func didReceiveData(cartInfo:Cart)
    func didReceiveCartProducts(products:[Products])
    func didReceiveRecommendedProducts(products:[Products])
    func didFailToGetData(message:String)
}

final class HomeViewModel {
    
    weak var delegate: HomeViewModelDelegate?
    
    var cartProducts = [Products]()
    var campaingProducts = [Products]()
    
    func fetchAllData(){
        
        let service = WebService()
        
        service.getCartDataOffline(completion: {allData,error  in
            
            print(allData)
            
            if((error) != nil)
            {
                self.delegate?.didFailToGetData(message: error?.localizedDescription ?? "Error")
                return
            }
            
            self.delegate?.didReceiveCartProducts(products: allData.cart?.products ?? [])
            self.delegate?.didReceiveRecommendedProducts(products: allData.recommended_products?.products ?? [])
            self.delegate?.didReceiveData(cartInfo: allData.cart!)
        })
    }
}
