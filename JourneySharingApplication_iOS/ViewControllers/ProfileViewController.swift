//
//  ProfileViewController.swift
//  JourneySharingApplication_iOS
//
//  Created by Ozan Duran on 6.03.2020.
//  Copyright © 2020 Ozan Emre Duran. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userNameSurname: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /*
         profile photo and username
         
        userNameSurname.text = "Ozan Duran"
        userNameSurname.textAlignment = .center
        userNameSurname.font = userNameSurname.font.withSize(25)
        
        profilePicture.layer.borderWidth = 1
        profilePicture.layer.masksToBounds = false
        profilePicture.layer.borderColor = UIColor.black.cgColor
        profilePicture.layer.cornerRadius = profilePicture.frame.height/2
        profilePicture.clipsToBounds = true
        */
    }

}
