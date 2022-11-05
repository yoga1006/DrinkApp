//
//  MenuTableViewCell.swift
//  DrinkApp
//
//  Created by Yoga on 2022/11/5.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var drinkCountry: UILabel!
    @IBOutlet weak var drinkDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
