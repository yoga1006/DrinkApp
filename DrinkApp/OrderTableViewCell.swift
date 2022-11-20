//
//  OrderTableViewCell.swift
//  DrinkApp
//
//  Created by Yoga on 2022/11/20.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var orderDrinkName: UILabel!
    
    @IBOutlet weak var orderDrinkPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
