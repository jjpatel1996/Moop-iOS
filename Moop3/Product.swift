//
//  Product.swift
//  Moop3
//
//  Created by Jay on 26/05/1938 Saka.
//  Copyright © 1938 Saka J@J_Comapny. All rights reserved.

import UIKit



/*struct Product {
    let name: String
    let description: String
    let image: UIImage
    let sale: String
    let saledetails: String
    let price: Float32
    
    
    init(name: String, description: String, image: UIImage, sale: String , saledetails: String , price: Float32) {
        self.name = name
        self.description = description
        self.image = image
        self.sale = sale
        self.saledetails = saledetails
        self.price = price
        
    }*/
    
    func productFromBundle() -> [jsonObjects] {
        print("1")
        
        
        guard let path = NSBundle.mainBundle().pathForResource("product", ofType: "json"),
            data = NSData(contentsOfFile: path) else {
                print("2")
                
                return jsonArray
        }
        
        do {
           
            let rootObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
      
            guard let productobjects = rootObject["product"] as? [[String: AnyObject]] else {
            return jsonArray
           
            }
            
            
           
            
            for productobject in productobjects {
               
                if let name1 = productobject["name"] as? String,
                 let description1 = productobject["description"]  as? String,
                 let sale1 = productobject["sale"]  as? String,
                 let saledetails1 = productobject["saledetails"]  as? String,
                  let price1 = productobject["price"]  as? Float32,
                 let imageName1 = productobject["image"] as? String,
                 let image = UIImage(named: imageName1) {
                        
                 print(name1 + description1 + sale1)
              let pro = jsonObjects(name: name1,  description: description1, image: image, sale: sale1, saledetails: saledetails1 , price: price1)
              jsonArray.append(pro)
                }
            }
        }
        catch {
            print("4")
            return jsonArray
        }
        print("5")
        return jsonArray
    }
    
//}