//
//  TokenResponse.swift
//  JourneySharingApplication_iOS
//
//  Created by Ozan Duran on 6.03.2020.
//  Copyright © 2020 Ozan Emre Duran. All rights reserved.
//

import Foundation

struct TokenResponse: Decodable {
    var emailAddress : String
    var token : String
}
