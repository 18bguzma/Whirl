//
//  ViewController.swift
//  Whirl
//
//  Created by HSOIMAC-01 on 12/7/17.
//  Copyright © 2017 WhirlDevTeam. All rights reserved.
//

import UIKit
import FacebookLogin

class SignInInitalVC: UIViewController {

    override func viewDidLoad() {
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.center = view.center
        
        view.addSubview(loginButton)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

