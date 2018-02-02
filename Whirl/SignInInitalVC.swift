//
//  ViewController.swift
//  Whirl
//
//  Created by HSOIMAC-01 on 12/7/17.
//  Copyright © 2017 WhirlDevTeam. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit


class SignInInitalVC: UIViewController {

    override func viewDidLoad() {
        let loginButton = LoginButton(readPermissions: [ .publicProfile, .email ])
        loginButton.center = view.center
       
        
        //performSegue(withIdentifier: "showMainScreen", sender: nil)
        view.addSubview(loginButton)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

