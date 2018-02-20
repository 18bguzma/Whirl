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
import FacebookCore


class SignInInitalVC: UIViewController {
    var loggedIn = false
    var logLoop = true
    override func viewDidLoad() {
        
        let loginButton = LoginButton(readPermissions: [ .publicProfile, .email ])
        loginButton.center = view.center
        view.addSubview(loginButton)
        
        //while(logLoop){
            
            if self.isViewLoaded {
                print("EEDS")
                //while(loggedIn == false){
                    print("EEDS TO FIGUREUT")
                    checkLogIn()
                    logLoop = false
                //}
            }
        
            print(self.isViewLoaded)
      //  }//end of while
        
        //checkLogIn()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
    }
    
    func checkLogIn(){
         print("BRANDON NEEDS TO FIGURE HIS LIFE OUT")
        if(FBSDKAccessToken.current() != nil){
            performSegue(withIdentifier: "fbLoggedIn", sender:nil)
            print("BRANDON")
           loggedIn = true
        }//end of if
        print("BRANDON AND ROSE")
    }
    
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        switch result {
        case .failed(let error):
            print("Facebook Authentication Error")
            print(error)
            break
        case .cancelled:
            print("Facebook Aurhentication Cancelled")
            break
        case .success( _, _, _):
            
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

