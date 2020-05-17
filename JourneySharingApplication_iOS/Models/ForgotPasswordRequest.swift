//
//  ForgotPasswordRequest.swift
//  JourneySharingApplication_iOS
//
//  Created by Ozan Duran on 13.03.2020.
//  Copyright © 2020 Ozan Emre Duran. All rights reserved.
//

import Foundation
struct ForgotPasswordRequest: Decodable {
    var id : UUID
    var token : String
    var emailAddress :  String
    var requestCode : String
    var creationDate : Date
    var expirationDate : Date
}
