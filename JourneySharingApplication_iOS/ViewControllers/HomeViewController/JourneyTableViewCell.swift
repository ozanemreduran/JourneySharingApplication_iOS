//
//  JourneyTableViewCell.swift
//  JourneySharingApplication_iOS
//
//  Created by Ozan Duran on 16.05.2020.
//  Copyright © 2020 Ozan Emre Duran. All rights reserved.
//

import UIKit

class JourneyTableViewCell: UITableViewCell {

    @IBOutlet weak var journeyCard: UIView!{
        didSet {
            journeyCard.layer.cornerRadius = 10
            journeyCard.layer.shadowOpacity = 0.8
            journeyCard.layer.shadowRadius = 2
            journeyCard.layer.shadowColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            journeyCard.layer.shadowOffset = CGSize(width: 1, height: 2)
            journeyCard.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.662745098, blue: 0.9568627451, alpha: 1)
        }
    }
    
    @IBOutlet weak var priceCard: UIView!{
        didSet {
            priceCard.layer.cornerRadius = 10
            priceCard.layer.shadowOpacity = 0.8
            priceCard.layer.shadowRadius = 2
            priceCard.layer.shadowColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            priceCard.layer.shadowOffset = CGSize(width: 1, height: 2)
            priceCard.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    @IBOutlet weak var fromLabel: UILabel! {
        didSet{
            fromLabel.frame = CGRect(x: 20, y: 0, width: 414, height: 50)
            fromLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .medium)
            fromLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    @IBOutlet weak var toLabel: UILabel!{
        didSet{
            
            toLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .regular)
            toLabel.textColor = #colorLiteral(red: 0.01176470588, green: 0.662745098, blue: 0.9568627451, alpha: 1)
        }
    }
    @IBOutlet weak var dateLabel: UILabel!{
        didSet{
            dateLabel.frame = CGRect(x: 20, y: 45, width: 414, height: 50)
            dateLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            dateLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            dateLabel.text = "20 Mayıs 2020 09:00"
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
