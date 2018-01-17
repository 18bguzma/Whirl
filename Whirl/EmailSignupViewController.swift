//
//  EmailSignupViewController.swift
//  Whirl
//
//  Created by HSOIMAC-01 on 1/10/18.
//  Copyright © 2018 WhirlDevTeam. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class EmailSignupViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passTextField: UITextField!
    @IBOutlet var repassTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passTextField.delegate = self
        usernameTextField.delegate = self
        self.hideKeyboardWhenTapAround()
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func signupButtonTapped(_ sender: Any) {
        if passTextField.text == repassTextField.text {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passTextField.text!, completion: { (user,error) in
            if error != nil {
                let signuperrorAlert = UIAlertController(title: "Signup Error", message: "\(error?.localizedDescription) Please try again later", preferredStyle: .alert)
                signuperrorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(signuperrorAlert, animated: true, completion: nil)
                return
            }
            })
        }
    }
    
    func sendEmail() {
        Auth.auth().signIn(withEmail: <#T##String#>, password: <#T##String#>, completion: <#T##AuthResultCallback?##AuthResultCallback?##(User?, Error?) -> Void#>)
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

extension UIViewController {
    func hideKeyboardWhenTapAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer((tap))
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
