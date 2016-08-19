//
//  DetailsVIew.swift
//  Moop3
//
//  Created by Jay on 26/05/1938 Saka.
//  Copyright © 1938 Saka J@J_Comapny. All rights reserved.
//

import UIKit

class DetailsView: UIViewController {
    
    @IBOutlet var name: UINavigationBar!
  
   var selectedProduct: jsonObjects!
    
    @IBOutlet var pimage: UIImageView!
    
    @IBOutlet var psale: UILabel!
    
    
    @IBOutlet var pdetails: UITextView!
    
    @IBOutlet var saledesription: UILabel!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        name.topItem!.title = selectedProduct.name2
        pimage.image = selectedProduct.image2
        psale.text = selectedProduct.sale2
        pdetails.text = selectedProduct.description2
        saledesription.text = selectedProduct.saledetails2
}

}

