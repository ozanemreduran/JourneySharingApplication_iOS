//
//  LogInViewController.swift
//  JourneySharingApplication_iOS
//
//  Created by Ozan Duran on 5.03.2020.
//  Copyright © 2020 Ozan Emre Duran. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LogInViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInLabel: UILabel!
    
    
    var userId : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInLabel.text = "Giriş Yap"
        logInLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        logInLabel.textColor = UIColor(red:0.01, green:0.66, blue:0.96, alpha:1.0)
        logInLabel.textAlignment = .center
        logInLabel.numberOfLines = 1
        logInLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logInLabel)
        NSLayoutConstraint.activate([
         logInLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
         logInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 110),
         logInLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -110),
         logInLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        emailTextField.placeholder = "E-mail"
        emailTextField.keyboardType = UIKeyboardType.emailAddress
        emailTextField.backgroundColor = UIColor(red:0.84, green:0.86, blue:0.87, alpha:1.0)
        emailTextField.layer.cornerRadius = 10.0
        emailTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        emailTextField.leftViewMode = .always
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        passwordTextField.placeholder = "Parola"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = UIColor(red:0.84, green:0.86, blue:0.87, alpha:1.0)
        passwordTextField.layer.cornerRadius = 10.0
        passwordTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        passwordTextField.leftViewMode = .always
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        let text1 = UITextField()
        text1.text = userId
        
        logInButton.backgroundColor = UIColor(red:0.01, green:0.66, blue:0.96, alpha:1.0)
        logInButton.layer.cornerRadius = 16
        logInButton.setTitle("Giriş Yap", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logInButton)
        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 230),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        forgotPassword.setTitle("Parolamı Unuttum", for: .normal)
        forgotPassword.setTitleColor(UIColor(red:0.01, green:0.66, blue:0.96, alpha:1.0), for: .normal)
        forgotPassword.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(forgotPassword)
        NSLayoutConstraint.activate([
            forgotPassword.topAnchor.constraint(equalTo: view.topAnchor, constant: 290),
            forgotPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            forgotPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120),
            forgotPassword.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        signUpButton.setTitle("Üye Ol", for: .normal)
        signUpButton.setTitleColor(UIColor(red:0.01, green:0.66, blue:0.96, alpha:1.0), for: .normal)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 320),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -140),
            signUpButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInButton(_ sender: Any) {
        
        
        
        let json: JSON =  ["password": passwordTextField.text!,"emailAddress": emailTextField.text!]
        
        AF.request("https://journey-sharing-application.herokuapp.com/token",
                   method: .post,
                   parameters: json,
                   encoder: JSONParameterEncoder.default).responseData { response in
                   let json = response.data

                   do{
                       let decoder = JSONDecoder()
                       //using the array to put values
                       let heroes = try decoder.decode(TokenResponse.self, from: json!)
                        print(heroes)
                    print(heroes.token)
                   }catch let err{
                       print(err)
                   }
                }
        UserDefaults.standard.set(emailTextField.text, forKey: "email")
        let storyBoard : UIStoryboard = UIStoryboard(name: "TabBar", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTabBar")
        self.show(nextViewController, sender: self)
        
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "ForgotPassword", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordViewController")
        self.show(nextViewController, sender: self)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "SignUp", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SignUpViewController")
        self.show(nextViewController, sender: self)
    }
    
    func displayMessage(userMessage: String) -> Void {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Uyarı", message: userMessage, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Tamam", style: .default){
                (action: UIAlertAction!) in
                print("OK Button Tapped")
                DispatchQueue.main.async {
                    self.dismiss(animated: false, completion: nil)
                }
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
