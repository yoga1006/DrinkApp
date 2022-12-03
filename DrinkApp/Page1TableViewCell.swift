//
//  Page1TableViewCell.swift
//  DrinkApp
//
//  Created by Yoga on 2022/12/3.
//

import UIKit

class Page1TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var drinkName1Label: UILabel!
    @IBOutlet weak var drinkCountry1Label: UILabel!
    @IBOutlet weak var drinkPrice1Label: UILabel!
    @IBOutlet weak var drinkDescription1Label: UILabel!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var backgroundImageView2: UIImageView!
    @IBOutlet weak var drinkImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundImageView.layer.cornerRadius = 30
        backgroundImageView2.layer.cornerRadius = 20
      
       
        drinkImageView.transform = CGAffineTransform(rotationAngle: (CGFloat.pi / 180)*40)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
