//
//  ShoppingcartTableViewCell.swift
//  DrinkApp
//
//  Created by Yoga on 2022/12/3.
//

import UIKit

class ShoppingcartTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var finalNameLabel: UILabel!
    
    @IBOutlet weak var finalDrinkLabel: UILabel!
    
    @IBOutlet weak var finalPriceLabel: UILabel!
    
    @IBOutlet weak var finalSugarLabel: UILabel!
    
    @IBOutlet weak var finalIceLabel: UILabel!
    
    @IBOutlet weak var finalBubbleLabel: UILabel!
    
    @IBOutlet weak var finalSizeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
