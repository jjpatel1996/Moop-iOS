//
//  ViewController.swift
//  Moop3
//
//  Created by Jay on 26/05/1938 Saka.
//  Copyright © 1938 Saka J@J_Comapny. All rights reserved.
//

import UIKit

var account = ["jay":"123" ,"meet":"ok"]


class ViewController: UIViewController {
    
    @IBOutlet weak var user: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    func displayerror(title:String,error:String)
    {
        /* let alert = UIAlertView(title: title, message: error, delegate: self, cancelButtonTitle: "OK")
        alert.show()*/
        let alertController = UIAlertController(title: title, message: error, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        NSUserDefaults.standardUserDefaults().setObject(account, forKey: "account")
        
        
        account = NSUserDefaults.standardUserDefaults().objectForKey("account") as! NSDictionary as! [String : String]
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func login(sender: AnyObject) {
        
        if user.text == "" || password.text == "" {
            
            displayerror("invalide", error: "Enter Valid Details")
            
            
            
        }else
        {
            
            let user1 = user.text
            let pass1 = password.text
            
            
            if account[user1!] != nil {
                if account[user1!] == pass1 {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ViewFeed")
                        self.presentViewController(viewController, animated: true, completion: nil)
                    })
                    
                }
                else
                {  displayerror("Sorry", error: "Wrong password")
                }
            }
            else{
                displayerror("Sorry", error: "Wrong Details")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

