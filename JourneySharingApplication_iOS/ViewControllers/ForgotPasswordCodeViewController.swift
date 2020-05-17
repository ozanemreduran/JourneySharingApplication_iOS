//
//  ForgotPasswordCodeViewController.swift
//  JourneySharingApplication_iOS
//
//  Created by Ozan Duran on 13.03.2020.
//  Copyright © 2020 Ozan Emre Duran. All rights reserved.
//

import UIKit
import CBPinEntryView

class ForgotPasswordCodeViewController: UIViewController {

    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var entryView: CBPinEntryView!
        /*{
        didSet {
            entryView.delegate = self
        }
    }*/
    @IBOutlet weak var sendCode: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forgotPasswordLabel.text = "Parolamı Unuttum"
        forgotPasswordLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        forgotPasswordLabel.textColor = UIColor(red:0.01, green:0.66, blue:0.96, alpha:1.0)
        forgotPasswordLabel.textAlignment = .center
        forgotPasswordLabel.numberOfLines = 1
        forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(forgotPasswordLabel)
        NSLayoutConstraint.activate([
            forgotPasswordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            forgotPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 110),
            forgotPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -110),
            forgotPasswordLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        view.addSubview(entryView)
        NSLayoutConstraint.activate([
            entryView.topAnchor.constraint(equalTo: view.topAnchor, constant: 145),
            entryView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            entryView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            entryView.heightAnchor.constraint(equalToConstant: 60)
        ])
        sendCode.backgroundColor = UIColor(red:0.01, green:0.66, blue:0.96, alpha:1.0)
        sendCode.layer.cornerRadius = 16
        sendCode.setTitle("Doğrulama Kodu Gönder", for: .normal)
        sendCode.setTitleColor(.white, for: .normal)
        sendCode.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sendCode)
        NSLayoutConstraint.activate([
            sendCode.topAnchor.constraint(equalTo: view.topAnchor, constant: 240),
            sendCode.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sendCode.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sendCode.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
   /* @IBAction func sendCode(_ sender: Any) {
        var codeString : String = entryView.getPinAsString()
        print(entryView.getPinAsInt() ?? "Not an int")
        entryView.resignFirstResponder()
    }*/
}

/*
extension ViewController: CBPinEntryViewDelegate {
    func entryCompleted(with entry: String?) {
        print(entry)
    }

    func entryChanged(_ completed: Bool) {
        if completed {
            print(pinEntryView.getPinAsString())
        }
    }
}
*/
