//
//  SignUpViewController.swift
//  CustomFirebaseAuthDemo
//
//  Created by Mitchell Hollander on 4/29/20.
//  Copyright © 2020 Mitchell Hollander. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        
        // Hide error label
        errorLabel.alpha = 0
    }
    
    // Check fields and validate that data is correct
    func validateFields() -> String? {
        
        // Check if all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 chars, contains a special char and a number."
        }
        
        return nil
    }

    @IBAction func signUpTapped(_ sender: Any) {
        
        // Validate fields
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }
        else {
            
            // Create cleaned versions of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
         
            // Create user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                // check for errors
                if err != nil {
                    // there was an error creating the user
                    self.showError("Error creating user.")
                }
                else {
                    
                    // User created successfully
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstName": firstName,
                      "lastName": lastName, "uid": result!.user.uid]) { (error) in
                                                                
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data.")
                        }
                    }
                    
                    // Transistion to home screen
                    self.transtionToHome()
                }
            }
            
        }
    }
    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
        
    }
    
    func transtionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    
}
