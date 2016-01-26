//
//  ViewController.swift
//  MockUP
//
//  Created by Ho Jeannie on 1/26/16.
//  Copyright © 2016 Ho Jeannie. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //check to see if access token is already there
        
        if(FBSDKAccessToken.currentAccessToken()==nil){
            print("Not logged in")
        }else{
            print("Logged In")
        }
        
        var loginButton = FBSDKLoginButton();
        loginButton.readPermissions=["public profie","email","user_friends"]
        loginButton.center=self.view.center;
        loginButton.delegate=self;
        self.view.addSubview(loginButton)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //When user clicks login
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if(error==nil){
            print("login complete")
            self.performSegueWithIdentifier("showNew", sender: self)
        }else{
            print(error.localizedDescription)
        }
    }
    
    //If they clicked the logout button
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User logged out")
    }

}

