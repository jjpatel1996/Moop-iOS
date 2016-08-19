//
//  SignUp.swift
//  Moop3
//
//  Created by Jay on 26/05/1938 Saka.
//  Copyright © 1938 Saka J@J_Comapny. All rights reserved.
//

import UIKit

//var people = [String:String]()

class SignUp: UIViewController {
    
    
    // @IBOutlet weak var name: UITextField!
    
    func displayerror1(title:String,error:String)
    {
        /* let alert = UIAlertView(title: title, message: error, delegate: self, cancelButtonTitle: "OK")
        alert.show()
        */
        
        
        let alertController = UIAlertController(title: title, message: error, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    // @IBOutlet weak var email: UITextField!
    
    
    @IBAction func SignUp(sender: AnyObject) {
        
        if username.text == "" || password.text == "" {
            
            displayerror1("invalide", error: "Enter Valid Details")
        }
        else
        {
            
            
            account[username.text!] = password.text
            NSUserDefaults.standardUserDefaults().setObject(account, forKey: "account")
            
            
            
            
            // print(account[username.text!])
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LogIn")
                self.presentViewController(viewController, animated: true, completion: nil)
            })
            
            
            
        }
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
}