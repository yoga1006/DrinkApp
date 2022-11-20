//
//  OrderViewController.swift
//  DrinkApp
//
//  Created by Yoga on 2022/11/20.
//

import UIKit

class OrderViewController: UIViewController {
    
    
    
    var cellData:DrinkData?
    
    
    @IBOutlet weak var orderDrinkName: UILabel!
    
    @IBOutlet weak var orderDrinkPrice: UILabel!
    
    init?(coder:NSCoder,cellData:DrinkData){
        self.cellData = cellData
        super.init(coder:coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
