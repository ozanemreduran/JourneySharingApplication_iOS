//
//  ViewController.swift
//  JourneySharingApplication_iOS
//
//  Created by Ozan Duran on 4.03.2020.
//  Copyright © 2020 Ozan Emre Duran. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var imageNightCar: UIImageView!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var slogan: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        icon.image = UIImage(named: "journey_sharing_application_icon")
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(icon)
        
        NSLayoutConstraint.activate([
            icon.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -755),
            icon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            icon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -300),
            icon.heightAnchor.constraint(equalToConstant: 40)
        ])
        productName.text = "Yolculuk Paylaşımı"
        productName.textAlignment = .center
        productName.textColor = UIColor(white: 1.00, alpha: 1.0)
        productName.numberOfLines = 3
        productName.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.medium)
        productName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(productName)
        
        NSLayoutConstraint.activate([
            productName.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -750),
            productName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 95),
            productName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            productName.heightAnchor.constraint(equalToConstant: 95)
        ])
        
        slogan.text = "Yolculuk Paylaşımı, uzun yolculuklarını daha zevkli hale getirir."
        slogan.textAlignment = .center
        slogan.numberOfLines = 3
        slogan.textColor = UIColor(white: 0.0, alpha: 1.0)
        slogan.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.medium)
        slogan.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slogan)
        
        NSLayoutConstraint.activate([
            slogan.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            slogan.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            slogan.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            slogan.heightAnchor.constraint(equalToConstant: 95)
            
        ])
        
        logInButton.backgroundColor = UIColor(red:0.01, green:0.66, blue:0.96, alpha:1.0)
        logInButton.layer.cornerRadius = 16
        logInButton.setTitle("Giriş Yap", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logInButton)
        
        NSLayoutConstraint.activate([
            logInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        signUpButton.backgroundColor = UIColor(red:0.01, green:0.66, blue:0.96, alpha:1.0)
        signUpButton.layer.cornerRadius = 16
        signUpButton.setTitle("Üye Ol", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    
    
}

