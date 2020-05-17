//
//  HomeViewController.swift
//  JourneySharingApplication_iOS
//
//  Created by Ozan Duran on 6.03.2020.
//  Copyright © 2020 Ozan Emre Duran. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var welcomeText: UILabel!
    @IBOutlet weak var createJourney: UIButton!
    @IBOutlet weak var findJourney: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WelcomeLabel()
        CreateJourneyButton()
        FindJourneyButton()
        
    }
    /*
    func assignArray() {

        let otherViewController = CreateJourneyViewController()
        arrayWithoutData = otherViewController.journeys
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var arrayWithoutData = [String]()

    var travelprices = ["55₺", "8,5₺", "5₺","55₺"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let otherViewController = CreateJourneyViewController()
        arrayWithoutData = otherViewController.journeys
        return arrayWithoutData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let otherViewController = CreateJourneyViewController()
        arrayWithoutData = otherViewController.journeys
        let cell = tableView.dequeueReusableCell(withIdentifier: "journeys") as! JourneyTableViewCell
        cell.fromLabel.text = arrayWithoutData[indexPath.row]
        cell.toLabel.text = travelprices[indexPath.row]
        return cell
    }
    func WelcomeLabel() {
        welcomeText.frame = CGRect(x: 0, y: 0, width: 414, height: 140)
        welcomeText.text = "Journey Sharing"
        welcomeText.textAlignment = .center
        welcomeText.font = UIFont.systemFont(ofSize: 26.0, weight: .bold)
        view.addSubview(welcomeText)
    }
    func CreateJourneyButton(){
        createJourney.frame = CGRect(x: 15, y: 750, width: 184, height: 50)
        createJourney.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.662745098, blue: 0.9568627451, alpha: 1)
        createJourney.layer.cornerRadius = 15
        createJourney.setTitle("Yolculuk Oluştur", for: .normal)
        createJourney.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    }
    func FindJourneyButton(){
        findJourney.frame = CGRect(x: 214, y: 750, width: 184, height: 50)
        findJourney.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.662745098, blue: 0.9568627451, alpha: 1)
        findJourney.layer.cornerRadius = 15
        findJourney.setTitle("Yolculuk Bul", for: .normal)
        findJourney.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    }
}
