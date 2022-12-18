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
    //糖度
    var finalsugar = ""
    //冰量
    var finalice = ""
    //尺寸
    var finalsize = ""
    
    @IBOutlet weak var orderDrinkName: UILabel!
    @IBOutlet weak var orderDrinkPrice: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var sizeChangeSegmentControl: UISegmentedControl!
    @IBOutlet weak var iceSegmentControl: UISegmentedControl!
    @IBOutlet weak var sugarSegmentControl: UISegmentedControl!
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
    
    
    
    //中杯大杯
    @IBAction func sizeMorL(_ sender: UISegmentedControl) {
        
        if sizeChangeSegmentControl.selectedSegmentIndex == 0{
            totalPriceLabel.text = priceMorL
        }else {
            finalPrice = Int(priceMorL)!+5
            totalPriceLabel.text = String("\(finalPrice)")
        }
    }
    
    //熱飲
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
    
    
    //加珍珠
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
    
    //糖度設定
    @IBAction func changeSugar(_ sender: UISegmentedControl) {
        if sugarSegmentControl.selectedSegmentIndex==0{
            finalsugar="無糖"
        }else if sugarSegmentControl.selectedSegmentIndex==1{
            finalsugar="微糖"
        }else if sugarSegmentControl.selectedSegmentIndex==2{
            finalsugar="少糖"
        }else {
            finalsugar="全糖"
        }
    }
    
    //冰量設定
    @IBAction func changeIce(_ sender: UISegmentedControl) {
        if iceSegmentControl.selectedSegmentIndex==0{
            finalice="去冰"
        }else if iceSegmentControl.selectedSegmentIndex==1{
            finalice="微冰"
        }else if sugarSegmentControl.selectedSegmentIndex==2{
            finalice="少冰"
        }else {
            finalice="正常"
        }
    }
    
    //中杯大杯設定
    @IBAction func changeSize(_ sender: UISegmentedControl) {
        if sizeChangeSegmentControl.selectedSegmentIndex==0{
            finalsize="中杯"
        }else{
            finalsize="大杯"
        }
    }
    
    //確認是否有資料輸入完全
    @IBAction func checkOrder(_ sender: Any) {
    
        if nameTextField.text == ""{
            let controller = UIAlertController(title: "訂購人姓名空白", message: "請輸入訂購人姓名", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            controller.addAction(action)
            present(controller, animated: true)
        }else{
        postOrder()
        // 顯示訂購成功的 Alert
        let controller = UIAlertController(title: nil, message: "訂購成功！", preferredStyle: .alert)
    
        controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(controller, animated: true ,completion: nil)
            
       
        }
        
    }
    
    func postOrder(){
        //抓取飲料設定的條件
        let ordername = nameTextField.text
        
        let drinkname = drinkName
        
        let size = finalsize
        
        let sugar = finalsugar
        
        let ice = finalice
        
        
        let url = URL(string: "https://api.airtable.com/v0/appsKrUpxDjeA04cU/order")!
        var request = URLRequest(url: url)
        request.setValue("Bearer key4MJhNePdp5IyUC", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let encoder = JSONEncoder()
        
        let orderresponse = OrderResponse(records: [.init(fields: OrderItem.init(orderName:ordername!, orderDrink:drinkname , orderSize: size, orderSugar: sugar, orderIce:ice ))])
        let data = try? encoder.encode(orderresponse)
        request.httpBody=data
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data,
                   let content = String(data: data, encoding: .utf8) {
                    print(content)
            }
            }.resume()
    
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


