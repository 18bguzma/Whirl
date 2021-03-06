//
//  SignInManualViewController.swift
//  Whirl
//
//  Created by HSOIMAC-01 on 12/7/17.
//  Copyright © 2017 WhirlDevTeam. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import Firebase

class SignInManualVC: UIViewController {

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    var userID = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameField.delegate = self as? UITextFieldDelegate
        passwordField.delegate = self as? UITextFieldDelegate
        self.hideKeyboardWhenTapAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func loginBtnTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: usernameField.text!, password: passwordField.text!) {(user, error) in
            if error != nil {
                let loginerrorAlert = UIAlertController(title: "Login Error", message: "\(error!.localizedDescription) Please try again.", preferredStyle: .alert)
                loginerrorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(loginerrorAlert, animated: true, completion: nil)
                return
            }
            
            if user!.isEmailVerified {
                //Take user to Firebase Realtime Database
                self.performSegue(withIdentifier: "emailLoggedIn", sender: self)
            } else {
                let notverfiedAlert = UIAlertController(title: "Not Verified", message: "Your account is pending verification. Please check your email and verify your account.", preferredStyle: .alert)
                notverfiedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(notverfiedAlert, animated: true, completion: nil)
                do {
                    try Auth.auth().signOut()
                } catch {
                    //Handle Error
                }
            }
        }
    }
    @IBAction func forgotPswTapped(_ sender: Any) {
        let forgotPswAlert = UIAlertController(title: "Forgot Password", message: "Don't worry. We can reset it for you. Just enter your email address here.", preferredStyle: .alert)
        forgotPswAlert.addTextField { (textField) in
            textField.placeholder = "Enter your email address"
        }
        forgotPswAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        forgotPswAlert.addAction(UIAlertAction(title: "Reset Password", style: .default, handler: { (action) in
            let resetEmail = forgotPswAlert.textFields?.first?.text
            Auth.auth().sendPasswordReset(withEmail: resetEmail!, completion: { (error) in
                if error != nil {
                    let resetFailedAlert = UIAlertController(title: "Reset Failed", message: "Error: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)
                    resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(resetFailedAlert, animated: true, completion: nil)
                } else {
                    let resetEmailSentAlert = UIAlertController(title: "Reset email sent", message: "A password reset email has been sent to your registered email address successfully! Please check your email for further password reset instructions.", preferredStyle: .alert)
                    resetEmailSentAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(resetEmailSentAlert, animated: true, completion: nil)
                }
            })
        }))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            passwordField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
