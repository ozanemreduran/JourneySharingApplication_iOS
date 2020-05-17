//
//  ProfileViewController.swift
//  JourneySharingApplication_iOS
//
//  Created by Ozan Duran on 6.03.2020.
//  Copyright © 2020 Ozan Emre Duran. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var userNameSurname: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pastJourneyLabel: UILabel!
    /*
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       
        // profile photo and username
         
        userNameSurname.text = "Ozan Duran"
        userNameSurname.textAlignment = .center
        userNameSurname.font = userNameSurname.font.withSize(25)
        
        view.anchor(animated: false, top: , leading: 80, bottom: 550, trailing: -20)
        userNameSurname.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
         userNameSurname.topAnchor.constraint(equalTo: view.topAnchor, constant: 490),
         userNameSurname.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
         userNameSurname.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
         userNameSurname.heightAnchor.constraint(equalToConstant: 95)
        ])
        
        profilePicture.layer.borderWidth = 1
        profilePicture.layer.masksToBounds = false
        profilePicture.layer.borderColor = UIColor.black.cgColor
        profilePicture.layer.cornerRadius = profilePicture.frame.height/2
        profilePicture.clipsToBounds = true
       
    }*/
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.662745098, blue: 0.9568627451, alpha: 1)
    
        
        view.addSubview(profileImageView)
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.anchor(top: view.topAnchor, paddingTop: 88,
                                width: 120, height: 120)
        profileImageView.layer.cornerRadius = 120 / 2
        
        view.addSubview(messageButton)
        messageButton.anchor(top: view.topAnchor, left: view.leftAnchor,
                             paddingTop: 64, paddingLeft: 32, width: 32, height: 32)
        
        view.addSubview(settingsButton)
        settingsButton.anchor(top: view.topAnchor, right: view.rightAnchor,
                             paddingTop: 64, paddingRight: 32, width: 32, height: 32)
        
        view.addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.anchor(top: profileImageView.bottomAnchor, paddingTop: 12)
        
        view.addSubview(aboutLabel)
        aboutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        aboutLabel.anchor(top: nameLabel.bottomAnchor, paddingTop: 4)
    
        view.addSubview(ageLabel)
        ageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ageLabel.anchor(top: aboutLabel.bottomAnchor, paddingTop: 4)
        
        return view
    }()
    
    let CellIndetifier = "pastJourneys"
    
    
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "pastJourneys") as! PastJourneyTableViewCell
        cell.fromLabel.text = arrayWithoutData[indexPath.row]
        cell.toLabel.text = travelprices[indexPath.row]
        return cell
    }
    func PastJourneyLabel() {
        pastJourneyLabel.frame = CGRect(x: 0, y: 0, width: 414, height: 140)
        pastJourneyLabel.text = "Geçmiş Yolculuklarım"
        pastJourneyLabel.textAlignment = .left
        pastJourneyLabel.font = UIFont.systemFont(ofSize: 26.0, weight: .bold)
        pastJourneyLabel.anchor( top: containerView.bottomAnchor, left: view.leftAnchor, bottom: tableView.topAnchor, right: view.rightAnchor, paddingTop: 5 ,paddingLeft: 20)
        view.addSubview(pastJourneyLabel)
    }
        
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "ProfilePhoto")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor.white.cgColor
        return iv
    }()
    
    let messageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "mail").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleMessageUser), for: .touchUpInside)
        return button
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "settings-30").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleFollowUser), for: .touchUpInside)
        return button
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Ozan Duran"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .white
        return label
    }()
    
    let aboutLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Öğrenci"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    let ageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "23 Yaş"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(containerView)
        containerView.anchor(top: view.topAnchor, left: view.leftAnchor,
                             right: view.rightAnchor, height: 320)
        
        self.view.addSubview(tableView)
        tableView.anchor( top: pastJourneyLabel.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        tableView.delegate = self
        tableView.dataSource = self
        PastJourneyLabel()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Selectors
    
    @objc func handleMessageUser() {
        print("Message user here..")
    }
    
    @objc func handleFollowUser() {
        print("Settings here..")
    }
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let journeyBlue = UIColor.rgb(red: 0, green: 150, blue: 255)
}

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = 0,
                paddingLeft: CGFloat? = 0, paddingBottom: CGFloat? = 0, paddingRight: CGFloat? = 0, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft!).isActive = true
        }
        
        if let bottom = bottom {
            if let paddingBottom = paddingBottom {
                bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
            }
        }
        
        if let right = right {
            if let paddingRight = paddingRight {
                rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
            }
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

