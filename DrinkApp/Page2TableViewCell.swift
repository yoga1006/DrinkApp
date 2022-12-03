//
//  Page2TableViewCell.swift
//  DrinkApp
//
//  Created by Yoga on 2022/12/3.
//

import UIKit

class Page2TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var drinkName2Label: UILabel!
    @IBOutlet weak var drinkCountry2Label: UILabel!
    @IBOutlet weak var drinkPrice2Label: UILabel!
    @IBOutlet weak var drinkDescription2Label: UILabel!
    
    @IBOutlet weak var background2ImageView: UIImageView!
    @IBOutlet weak var background2ImageView2: UIImageView!
    @IBOutlet weak var drinkImageView2: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        background2ImageView.layer.cornerRadius = 30
        background2ImageView2.layer.cornerRadius = 20
      
       
        drinkImageView2.transform = CGAffineTransform(rotationAngle: (CGFloat.pi / 180)*320)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
