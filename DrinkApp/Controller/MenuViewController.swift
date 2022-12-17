//
//  MenuViewController.swift
//  DrinkApp
//
//  Created by Yoga on 2022/12/3.
//

import UIKit

class MenuViewController: UIViewController {

    //不同飲料分類在不同的containerView
    @IBOutlet var containerViews: [UIView]!
    @IBOutlet weak var drinkSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        containerViews[0].isHidden = false
        containerViews[1].isHidden = true
        containerViews[2].isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    //飲料選單點選
    @IBAction func changeMenu(_ sender: UISegmentedControl) {
        
        for containerView in containerViews {
           containerView.isHidden = true
        }
        containerViews[sender.selectedSegmentIndex].isHidden = false
        
        
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
