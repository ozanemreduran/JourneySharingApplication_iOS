//
//  SignUpViewController.swift
//  JourneySharingApplication_iOS
//
//  Created by Ozan Duran on 5.03.2020.
//  Copyright © 2020 Ozan Emre Duran. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignUpViewController: UIViewController {

    @IBOutlet weak var genderSelect: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var userTermsSwitch: UISwitch!
    @IBOutlet weak var userTermLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var logInLabel: UILabel!
    private var birthdayDatePicker : UIDatePicker?
    var gender : Bool = false
    
     
    
    override func viewDidLoad() {
        super.viewDidLoad()

        genderSelect.setTitle("Kadın", forSegmentAt: 0)
        genderSelect.setTitle("Erkek", forSegmentAt: 1)
        if genderSelect.selectedSegmentIndex == 0 {
        gender = false
        } else if genderSelect.selectedSegmentIndex == 1 {
        gender = true
        }
        genderSelect.selectedSegmentIndex = UISegmentedControl.noSegment
        genderSelect.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(genderSelect)
        NSLayoutConstraint.activate([
         genderSelect.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
         genderSelect.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
         genderSelect.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        nameTextField.placeholder = "Ad"
        nameTextField.backgroundColor = UIColor(red:0.84, green:0.86, blue:0.87, alpha:1.0)
        nameTextField.layer.cornerRadius = 10.0
        nameTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        nameTextField.leftViewMode = .always
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        NSLayoutConstraint.activate([
         nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant:110),
         nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
         nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
         nameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        surnameTextField.placeholder = "Soyad"
        surnameTextField.backgroundColor = UIColor(red:0.84, green:0.86, blue:0.87, alpha:1.0)
        surnameTextField.layer.cornerRadius = 10.0
        surnameTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        surnameTextField.leftViewMode = .always
        surnameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(surnameTextField)
        NSLayoutConstraint.activate([
         surnameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
         surnameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
         surnameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
         surnameTextField.heightAnchor.constraint(equalToConstant: 40)
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
         emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 230),
         emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
         emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
         emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        let minimumAge: Date = Calendar.current.date(byAdding: .year, value: -18, to: Date())!
        let maximumAge: Date = Calendar.current.date(byAdding: .year, value: -120, to: Date())!
        birthdayDatePicker = UIDatePicker()
        birthdayDatePicker?.datePickerMode = .date
        birthdayDatePicker?.maximumDate = minimumAge
        birthdayDatePicker?.minimumDate = maximumAge
        birthdayDatePicker?.addTarget(self, action: #selector(SignUpViewController.dateChanged(birthdayDatePicker:)), for: .valueChanged)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.viewTapped(gestureRecognizer:)))

        view.addGestureRecognizer(tapGesture)

        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()

        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(SignUpViewController.doneClick))

        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        //let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(SignUpScreenViewController.cancelClick))

        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        birthdayTextField.inputAccessoryView = toolBar
        //birthdayTextField.text = "2000/08/20"
        birthdayTextField.inputView = birthdayDatePicker
        birthdayTextField.placeholder = "Doğum Tarihi"
        birthdayTextField.backgroundColor = UIColor(red:0.84, green:0.86, blue:0.87, alpha:1.0)
        birthdayTextField.layer.cornerRadius = 10.0
        birthdayTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        birthdayTextField.leftViewMode = .always
        birthdayTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(birthdayTextField)
        NSLayoutConstraint.activate([
         birthdayTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 290),
         birthdayTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
         birthdayTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
         birthdayTextField.heightAnchor.constraint(equalToConstant: 40)
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
         passwordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
         passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
         passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
         passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        passwordLabel.text = "Şifraniz küçük harf, büyük harf, sayı ve özel karakter içermelidir. Ayrıca şifreniz en az 6 karakter olmalıdır."
        passwordLabel.textAlignment = .left
        passwordLabel.numberOfLines = 3
        passwordLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordLabel)

        NSLayoutConstraint.activate([
         passwordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 370),
         passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
         passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
         passwordLabel.heightAnchor.constraint(equalToConstant: 95)
        ])
        confirmPasswordTextField.placeholder = "Parola Tekrarı"
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.backgroundColor = UIColor(red:0.84, green:0.86, blue:0.87, alpha:1.0)
        confirmPasswordTextField.layer.cornerRadius = 10.0
        confirmPasswordTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        confirmPasswordTextField.leftViewMode = .always
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(confirmPasswordTextField)
        NSLayoutConstraint.activate([
         confirmPasswordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
         confirmPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
         confirmPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
         confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])

        userTermLabel.text = "Kullanıcı Profili Şartları ve Koşullarını okudum ve kabul ediyorum"
        userTermLabel.textAlignment = .left
        userTermLabel.numberOfLines = 3
        userTermLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userTermLabel)

        NSLayoutConstraint.activate([
         userTermLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 490),
         userTermLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
         userTermLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
         userTermLabel.heightAnchor.constraint(equalToConstant: 95)
        ])
        // userTermsSwitch.backgroundColor = UIColor(red: 255.0/255, green: 0.0/255, blue: 0.0/255, alpha: 1.0)
        userTermsSwitch.setOn(false, animated: false)
        userTermsSwitch.onTintColor = UIColor(red:0.01, green:0.66, blue:0.96, alpha:1.0)
        userTermsSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userTermsSwitch)
        NSLayoutConstraint.activate([
         userTermsSwitch.topAnchor.constraint(equalTo: view.topAnchor, constant: 520),
         userTermsSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
         userTermsSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
         userTermsSwitch.heightAnchor.constraint(equalToConstant: 95)
        ])
        signUpButton.backgroundColor = UIColor(red:0.01, green:0.66, blue:0.96, alpha:1.0)
        signUpButton.layer.cornerRadius = 16
        signUpButton.setTitle("Kayıt Ol", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpButton)
        NSLayoutConstraint.activate([
         signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
         signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
         signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
         signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        logInButton.setTitle("Giriş Yap", for: .normal)
        logInButton.setTitleColor(UIColor(red:0.01, green:0.66, blue:0.96, alpha:1.0), for: .normal)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logInButton)
        NSLayoutConstraint.activate([
            logInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 240),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            logInButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        logInLabel.text = "Hesabınız var mı? "
        logInLabel.textAlignment = .left
        logInLabel.numberOfLines = 1
        logInLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logInLabel)

        NSLayoutConstraint.activate([
         logInLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
         logInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 110),
         logInLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
         logInLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
    
        if(nameTextField.text?.isEmpty)! || (surnameTextField.text?.isEmpty)! || (emailTextField.text?.isEmpty)! || (birthdayTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! || (confirmPasswordTextField.text?.isEmpty)! {
            displayMessage(userMessage: "Lütfen tüm alanları doldurunuz")
            return
        }

        if((passwordTextField.text?.elementsEqual(confirmPasswordTextField.text!))! != true){
            displayMessage(userMessage: "Parola ve tekrarı aynı değil.")
            return
        }
        
        if(validateEmail(enteredEmail: emailTextField.text!) != true){
            displayMessage(userMessage: "Geçerli bir e-posta adresi giriniz.")
            return
        }
        
        if(userTermsSwitch.isOn == false){
            displayMessage(userMessage: "\"Kullanıcı Profili Şartları ve Koşullarını okudum ve kabul ediyorum\" seçili değil.")
            return
        }
        
        let json: JSON =  ["gender": genderSelect.selectedSegmentIndex, "birthday": birthdayTextField.text!, "password": passwordTextField.text!, "emailAddress": emailTextField.text!, "surname": surnameTextField.text!, "name": nameTextField.text!]
               
        AF.request("https://journey-sharing-application.herokuapp.com/user/save",
              method: .post,
              parameters: json,
              encoder: JSONParameterEncoder.default).responseData { response in
                debugPrint(response)

                let json = response.data

                do{
                    let decoder = JSONDecoder()
                    let heroes = try decoder.decode(TokenResponse.self, from: json!)
                    print(heroes)
                    print(heroes.token)
                }catch let err{
                  print(err)
                }
            }
        let storyBoard : UIStoryboard = UIStoryboard(name: "Home", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController")
        self.show(nextViewController, sender: self)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
         view.endEditing(true)
     }
     
    @objc func dateChanged(birthdayDatePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        birthdayTextField.text = dateFormatter.string(from: birthdayDatePicker.date)
    }
     
    @objc func doneClick() {
        birthdayTextField.resignFirstResponder()
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
    
}
