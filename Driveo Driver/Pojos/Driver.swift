//
//  User.swift
//  FinalProject
//
//  Created by Admin on 6/1/18.
//  Copyright © 2018 ITI. All rights reserved.
//

import Foundation

class Driver {
    
    var password:String?
    var phone:String?
    var email:String?
    var confirmPassword:String?
    var name:String?
    var avatar:String?
    init(email: String , phone:String, password:String) {
        self.email=email
         self.phone=phone
         self.password=password
    }
    
    func getUserDataInDictionary()->[String:String]{
        return ["email":self.email!,"phone":self.phone!,"password":self.password!]
    }
}
