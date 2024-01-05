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
      func getCartDataOffline(completion: @escaping (_ allData: CartData, _ error: Error?) -> Void) {
            
            guard let filePath = Bundle.main.url(forResource: "CartData", withExtension: "json") else {
                return
            }

            do {
                
                let data = try Data(contentsOf: filePath)
                let result = try JSONDecoder().decode(Model_Base.self, from: data)
                
                completion(result.data! ,nil)
                
               
            } catch {
                print(String(describing: error))
                
               // completion(Void ,error)
            }
        }
}
