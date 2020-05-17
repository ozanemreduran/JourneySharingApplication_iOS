//
//  PastJourneyTableViewCell.swift
//  JourneySharingApplication_iOS
//
//  Created by Ozan Duran on 17.05.2020.
//  Copyright © 2020 Ozan Emre Duran. All rights reserved.
//

import UIKit

class PastJourneyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pastJourneyCard: UIView!{
        didSet {
            pastJourneyCard.layer.cornerRadius = 10
            pastJourneyCard.layer.shadowOpacity = 0.8
            pastJourneyCard.layer.shadowRadius = 2
            pastJourneyCard.layer.shadowColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            pastJourneyCard.layer.shadowOffset = CGSize(width: 0.5, height: 1)
            pastJourneyCard.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.662745098, blue: 0.9568627451, alpha: 1)
        }
    }
    
    @IBOutlet weak var fromLabel: UILabel!{
        didSet{
            fromLabel.frame = CGRect(x: 20, y: 0, width: 414, height: 50)
            fromLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .medium)
            fromLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    @IBOutlet weak var toLabel: UILabel!{
        didSet{
            toLabel.frame = CGRect(x: 320, y: 0, width: 414, height: 50)
            toLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .regular)
            toLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
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
