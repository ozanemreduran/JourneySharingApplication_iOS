//
//  NotificationsViewController.swift
//  JourneySharingApplication_iOS
//
//  Created by Ozan Duran on 12.04.2020.
//  Copyright © 2020 Ozan Emre Duran. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var notificationTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationsTitle()
        
    }
    
    var journeys = ["Ankara -> İstanbul", "Kadıköy -> Kartal", "Kartal -> Çekmeköy"]
    var travelprices = ["55₺", "8,5₺", "5₺"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journeys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "notifications")!
               cell.textLabel?.text = journeys[indexPath.row]
               cell.detailTextLabel?.text = travelprices[indexPath.row]
               return cell
    }
    func NotificationsTitle() {
        notificationTitle.frame = CGRect(x: 0, y: 0, width: 414, height: 140)
        notificationTitle.text = "Bildirimler"
        notificationTitle.textAlignment = .center
        notificationTitle.font = UIFont.systemFont(ofSize: 26.0, weight: .bold)
        view.addSubview(notificationTitle)
    }
    

    
}
