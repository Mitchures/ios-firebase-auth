//
//  Utilities.swift
//  CustomFirebaseAuthDemo
//
//  Created by Mitchell Hollander on 4/29/20.
//  Copyright © 2020 Mitchell Hollander. All rights reserved.
//

import UIKit

class Utilities {

    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
        
    }
}
