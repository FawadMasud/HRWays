//
//  Webservice.swift
//  NiceOne
//
//  Created by Fawad Masud on 04/01/2024.
//

import Foundation
import UIKit

public class WebService:NSObject{
    
    //Offline Data
      func getCartDataOffline(completion: @escaping (_ cartData: [Products],_ recommended:[Products], _ error: Error?) -> Void) {
            
            guard let filePath = Bundle.main.url(forResource: "CartData", withExtension: "json") else {
                return
            }

            do {
                
                let data = try Data(contentsOf: filePath)
                let result = try JSONDecoder().decode(Model_Base.self, from: data)
                
                completion(result.data?.cart?.products ?? [],result.data?.recommended_products?.products ?? [],nil)
                
               
            } catch {
                print(String(describing: error))
            }
        }
}
