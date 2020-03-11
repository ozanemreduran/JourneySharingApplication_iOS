//
//  User.swift
//  deneme10
//
//  Created by Ozan Duran on 27.02.2020.
//  Copyright © 2020 Ozan Duran. All rights reserved.
//

import Foundation

struct User {
    
    var id : UUID?
    var name : String
    var surname : String
    var emailAddress : String
    var password : String
    var profilePicture : String?
    var birthday : Date
    var joinDate : Date?
    var gender : Bool
    var biography : String?
    var additions : String?
    var discountTypeFk  :  DiscountType?
    var socialMediaFk : SocialMedia?
    var roleFk : Role?
    var isActive : Bool?
    
    init(name: String, surname: String, emailAddress: String, password: String, birthday: Date, gender: Bool ) {
        self.id = nil
        self.name = name
        self.surname = surname
        self.emailAddress  = emailAddress
        self.password = password
        self.profilePicture = nil
        self.birthday = birthday
        self.joinDate = nil
        self.gender = gender
        self.biography = nil
        self.additions = nil
        self.discountTypeFk = nil
        self.socialMediaFk = nil
        self.roleFk = nil
        self.isActive = nil
    }
}
