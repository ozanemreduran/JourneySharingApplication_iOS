//
//  TokenResponse.swift
//  JourneySharingApplication_iOS
//
//  Created by Ozan Duran on 6.03.2020.
//  Copyright © 2020 Ozan Emre Duran. All rights reserved.
//

import Foundation
import SwiftyJSON

struct LogInRequest: Codable{
    var emailAddress : String
    var password : String
}

