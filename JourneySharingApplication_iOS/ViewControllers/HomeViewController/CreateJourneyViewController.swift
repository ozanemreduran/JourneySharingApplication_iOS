//
//  CreateJourneyViewController.swift
//  JourneySharingApplication_iOS
//
//  Created by Ozan Duran on 16.05.2020.
//  Copyright © 2020 Ozan Emre Duran. All rights reserved.
//

import UIKit

class CreateJourneyViewController: UIViewController {

    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var journeyDateTextField: UITextField!
    @IBOutlet weak var createJourneyButton: UIButton!
    @IBOutlet weak var passengerCapacityTextField: UITextField!
    @IBOutlet weak var journeyPriceTextField: UITextField!
    private var journeyDatePicker : UIDatePicker?
    
    var journeys = ["Ankara -> İstanbul", "Kadıköy -> Kartal", "Kartal -> Çekmeköy","Kartal -> Çekmeköy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FromTextField()
        ToTextField()
        JourneyDateTextField()
        PassengerCapacityTextField()
        JourneyPriceTextField()
        
        CreateJourneyButton()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CreateJourneyViewController.viewTapped(gestureRecognizer:)))

        view.addGestureRecognizer(tapGesture)
    }
    func JourneyDateTextField(){
        journeyDatePicker = UIDatePicker()
        journeyDatePicker?.datePickerMode = .dateAndTime
        journeyDatePicker?.locale = Locale(identifier: "en_GB")
        journeyDatePicker?.addTarget(self, action: #selector(CreateJourneyViewController.dateChanged(journeyDatePicker:)), for: .valueChanged)
        journeyDateTextField.inputView = journeyDatePicker
        journeyDateTextField.placeholder = "Yolculuk tarihi ve Saati"
        journeyDateTextField.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
        journeyDateTextField.layer.cornerRadius = 10.0
        journeyDateTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        journeyDateTextField.leftViewMode = .always
        view.addSubview(journeyDateTextField)
    }
    func FromTextField(){
        fromTextField.placeholder = "Nereden"
        fromTextField.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
        fromTextField.layer.cornerRadius = 10.0
        view.addSubview(fromTextField)
    }
    func ToTextField(){
        toTextField.placeholder = "Nereye"
        toTextField.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
        toTextField.layer.cornerRadius = 10.0
        view.addSubview(toTextField)
    }
    func PassengerCapacityTextField(){
        passengerCapacityTextField.placeholder = "Yolcu Kapasitesi"
        passengerCapacityTextField.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
        passengerCapacityTextField.layer.cornerRadius = 10.0
        view.addSubview(passengerCapacityTextField)
    }
    func JourneyPriceTextField(){
        journeyPriceTextField.placeholder = "Yolculuk Ücreti"
        journeyPriceTextField.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
        journeyPriceTextField.layer.cornerRadius = 10.0
        view.addSubview(journeyPriceTextField)
    }
    func CreateJourneyButton(){
        createJourneyButton.frame = CGRect(x: 15, y: 268, width: 384, height: 50)
        createJourneyButton.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.662745098, blue: 0.9568627451, alpha: 1)
        createJourneyButton.layer.cornerRadius = 15
        createJourneyButton.setTitle("Yolculuk Oluştur", for: .normal)
        createJourneyButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func dateChanged(journeyDatePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd h:mm"
        journeyDateTextField.text = dateFormatter.string(from: journeyDatePicker.date)
    }
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    @IBAction func CreateJourneyButton(_ sender: Any) {
        self.journeys.append("133")
        print(journeys)
    }
    
}
