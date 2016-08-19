//
//  ProductListViewController.swift
//  Moop3
//
//  Created by Jay on 26/05/1938 Saka.
//  Copyright © 1938 Saka J@J_Comapny. All rights reserved.
//
import UIKit

var jsonArray = [jsonObjects]()

class ProductListViewController: UIViewController {
    
    let products = productFromBundle()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
   
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserverForName(UIContentSizeCategoryDidChangeNotification,
            object: nil,
            queue: NSOperationQueue.mainQueue()) {
                [weak self] _ in self?.tableView.reloadData()
        }
    }
    //Used To Move To Details Page
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailsView" {
            if let destination = segue.destinationViewController as? DetailsView,
                indexPath = tableView.indexPathForSelectedRow {
                    destination.selectedProduct = products[indexPath.row]
            }
        }
    }
}

extension ProductListViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ProductTableViewCell
            
            let product = products[indexPath.row]
            cell.name.text = product.name2
           cell.images.image = product.image2
            cell.sale.text = product.sale2
       //     cell.sale.textColor = UIColor(red: 114 / 255, green: 114 / 255, blue: 114 / 255, alpha: 1.0)
       //     cell.name.backgroundColor = UIColor(red: 255 / 255, green: 152 / 255, blue: 1 / 255, alpha: 1.0)
        //    cell.name.textColor = UIColor.whiteColor()
            cell.name.textAlignment = .Center
            cell.selectionStyle = .None
            cell.name.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
            cell.sale.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
            return cell
    }
}
