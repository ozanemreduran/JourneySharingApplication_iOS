//
//  ForgotPasswordViewController.swift
//  JourneySharingApplication_iOS
//
//  Created by Ozan Duran on 7.03.2020.
//  Copyright © 2020 Ozan Emre Duran. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sendCode: UIButton!
    @IBOutlet weak var forgotPassword: UILabel!
    @IBOutlet weak var logInBack: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forgotPassword.text = "Parolamı Unuttum"
        forgotPassword.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        forgotPassword.textColor = UIColor(red:0.01, green:0.66, blue:0.96, alpha:1.0)
        forgotPassword.textAlignment = .center
        forgotPassword.numberOfLines = 1
        forgotPassword.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(forgotPassword)
        NSLayoutConstraint.activate([
         forgotPassword.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
         forgotPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 110),
         forgotPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -110),
         forgotPassword.heightAnchor.constraint(equalToConstant: 20)
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
            emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        sendCode.backgroundColor = UIColor(red:0.01, green:0.66, blue:0.96, alpha:1.0)
        sendCode.layer.cornerRadius = 16
        sendCode.setTitle("Doğrulama Kodu Gönder", for: .normal)
        sendCode.setTitleColor(.white, for: .normal)
        sendCode.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sendCode)
        NSLayoutConstraint.activate([
            sendCode.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            sendCode.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sendCode.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sendCode.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        logInBack.setTitle("Giriş Yap", for: .normal)
        logInBack.setTitleColor(UIColor(red:0.01, green:0.66, blue:0.96, alpha:1.0), for: .normal)
        logInBack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logInBack)
        NSLayoutConstraint.activate([
            logInBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 240),
            logInBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logInBack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logInBack.heightAnchor.constraint(equalToConstant: 50)
        ])
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendCode(_ sender: Any) {
        
        
        if(emailTextField.text?.isEmpty)!{
            displayMessage(userMessage: "Lütfen e-posta giriniz")
            return
        }
        if (validateEmail(enteredEmail: emailTextField.text!) != true) {
            displayMessage(userMessage: "Lütfen geçerli bir e-posta giriniz")
            return
        }
        let json = ["receiverEmailAddress" : "com"]
        
        AF.request("https://journey-sharing-application.herokuapp.com/email/forgotPassword",
                    method: .get,
                    parameters: json).responseData { response in
                    debugPrint(response)
                    let json = response.data
                   do{
                       let decoder = JSONDecoder()
                    let heroes = try decoder.decode(ForgotPasswordRequest.self, from: json!)
                        print(heroes)
                   }catch let err{
                       print(err)
                   }
                }
        let storyBoard : UIStoryboard = UIStoryboard(name: "ForgotPasswordCode", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordCodeViewController")
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
    func validateEmail(enteredEmail:String) -> Bool {

        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }
    
    @IBAction func logInBack(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "LogIn", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LogInViewController")
        self.show(nextViewController, sender: self)
    }
    
    
}
