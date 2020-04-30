//
//  LoginViewController.swift
//  CustomFirebaseAuthDemo
//
//  Created by Mitchell Hollander on 4/29/20.
//  Copyright © 2020 Mitchell Hollander. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
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

    
    
    @IBAction func loginTapped(_ sender: Any) {
        
        // validate text fields
        
        // sign in user
        
    }
    
}
