//
//  Page3TableViewCell.swift
//  DrinkApp
//
//  Created by Yoga on 2022/12/3.
//

import UIKit

class Page3TableViewCell: UITableViewCell {

    @IBOutlet weak var drinkName3Label: UILabel!
    @IBOutlet weak var drinkCountry3Label: UILabel!
    @IBOutlet weak var drinkPrice3Label: UILabel!
    @IBOutlet weak var drinkDescription3Label: UILabel!
    
    @IBOutlet weak var background3ImageView: UIImageView!
    @IBOutlet weak var background3ImageView2: UIImageView!
    @IBOutlet weak var drinkImageView3: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        background3ImageView.layer.cornerRadius = 30
        background3ImageView2.layer.cornerRadius = 20
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
