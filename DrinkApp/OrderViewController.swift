//
//  OrderViewController.swift
//  DrinkApp
//
//  Created by Yoga on 2022/11/20.
//

import UIKit

class OrderViewController: UIViewController {
    
    
    
    var menuinfo:DrinkData?
    let drinkName:String
    var priceMorL:String
    let indexPath:Int
    var hotornot:Bool?
    var bubbleornot:Bool?
    
    //總金額
    var finalPrice =  0
    
    @IBOutlet weak var orderDrinkName: UILabel!
    @IBOutlet weak var orderDrinkPrice: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var sizeChangeSegmentControl: UISegmentedControl!
    @IBOutlet weak var iceSegmentControl: UISegmentedControl!
    @IBOutlet weak var hotSwitch: UISwitch!
    @IBOutlet weak var bubbleSwitch: UISwitch!
    
    @IBOutlet weak var orderBackgroundImageView1: UIImageView!
    @IBOutlet weak var orderBackgroundImageView2: UIImageView!
    
    init?(coder:NSCoder,menuinfo:DrinkData , indexPath:Int){
        self.drinkName = menuinfo.records[indexPath].fields.name
    
        self.hotornot = menuinfo.records[indexPath].fields.hot

        self.bubbleornot = menuinfo.records[indexPath].fields.bubble
        
        if menuinfo.records[indexPath].fields.pricem == nil{
            self.priceMorL = menuinfo.records[indexPath].fields.pricel!
            
        }else{
            self.priceMorL = menuinfo.records[indexPath].fields.pricem!
            
        }
        self.indexPath = indexPath
        
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orderBackgroundImageView1.layer.cornerRadius = 30
        orderBackgroundImageView2.layer.cornerRadius = 20
        

        orderDrinkName.text = drinkName
        orderDrinkPrice.text = priceMorL
        totalPriceLabel.text = priceMorL
        
        if hotornot == true{
            hotSwitch.isHidden=false
        }else{
            hotSwitch.isHidden=true
        }
        
        if bubbleornot == true{
            bubbleSwitch.isHidden=false
        }else{
            bubbleSwitch.isHidden=true
        }
        
        
        // Do any additional setup after loading the view.
        
    }
    

    @IBAction func sizeMorL(_ sender: UISegmentedControl) {
        
        if sizeChangeSegmentControl.selectedSegmentIndex == 0{
            totalPriceLabel.text = priceMorL
        }else {
            finalPrice = Int(priceMorL)!+5
            totalPriceLabel.text = String("\(finalPrice)")
        }
    }
    
    
    @IBAction func hotOrNot(_ sender: UISwitch) {
        if hotSwitch.isOn{
            iceSegmentControl.isHidden = true
            //熱飲只能做中杯無法選擇大小
            sizeChangeSegmentControl.isHidden = true
            finalPrice = Int(priceMorL)!+5
            totalPriceLabel.text = String("\(finalPrice)")
            
            
        }else{
            iceSegmentControl.isHidden = false
            sizeChangeSegmentControl.isHidden=false
            finalPrice = finalPrice-5
            totalPriceLabel.text = String("\(finalPrice)")
        }
        
    }
    
    
    
    @IBAction func addBubble(_ sender: UISwitch) {
        
        if bubbleSwitch.isOn == true{
            finalPrice = Int(priceMorL)!+5
            
            if sizeChangeSegmentControl.selectedSegmentIndex == 1 || hotSwitch.isOn == true{
            
                finalPrice = finalPrice+5}
            
                totalPriceLabel.text = String("\(finalPrice)")
        }else{
            finalPrice = finalPrice-5
            totalPriceLabel.text = String("\(finalPrice)")
        }
        
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
