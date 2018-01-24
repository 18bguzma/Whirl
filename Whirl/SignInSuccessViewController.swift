//
//  SignInSuccessViewController.swift
//  Whirl
//
//  Created by HSOIMAC-01 on 1/24/18.
//  Copyright © 2018 WhirlDevTeam. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class SignInSuccessViewController: UIViewController {
    var userID = Auth.auth().currentUser?.uid

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pullUserID()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var uidlabelholder: UILabel!
    func pullUserID() {
        uidlabelholder.text = userID
        print(userID!)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
