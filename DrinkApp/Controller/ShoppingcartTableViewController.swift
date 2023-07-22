//
//  ShoppingcartTableViewController.swift
//  DrinkApp
//
//  Created by Yoga on 2022/12/3.
//

import UIKit
//飲料總訂購單
class ShoppingcartTableViewController: UITableViewController {
    
    @IBOutlet weak var totalCupLabel: UILabel!
    
    var orderData:OrderResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchOrderData()
                // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return orderData?.records.count ?? 0
    }

    //訂購單資料放入自訂 Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.rowHeight = 180  //調整cell的大小
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ShoppingcartTableViewCell.self)", for: indexPath)as! ShoppingcartTableViewCell

        let data = orderData?.records[indexPath.row].fields
        
        cell.finalNameLabel.text = data?.orderName
        cell.finalDrinkLabel.text = data?.orderDrink
        cell.finalSugarLabel.text = data?.orderSugar
        cell.finalIceLabel.text = data?.orderIce
        cell.finalBubbleLabel.text = data?.orderBubble
        cell.finalSizeLabel.text = data?.orderSize
        cell.finalPriceLabel.text = data?.orderPrice
        
        //計算總杯數
        totalCupLabel.text = "\(orderData?.records.count ?? 0)"
        return cell
    
    
    }
    
    //抓取訂單資料
    func fetchOrderData(){
        
        if let url = URL(string: "https://api.airtable.com/v0/appsKrUpxDjeA04cU/order"){
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("Bearer key4MJhNePdp5IyUC", forHTTPHeaderField: "Authorization")
            URLSession.shared.dataTask(with: request) { data, response, error in
            
                if let data = data {
                    let decoder = JSONDecoder()
                    do{
                        self.orderData = try decoder.decode(OrderResponse.self, from: data)
                        print(String(data: data, encoding: .utf8)!)

                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    }catch{
                        print(error)
                    }
                    
                }
                
            }.resume()
        }
    }
    
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    //delete刪除訂單功能
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        //點選刪除
        if editingStyle == .delete {
            
            //跳出提醒
            let controller = UIAlertController(title: "\((orderData?.records[indexPath.row].fields.orderName)!)的"+"\((orderData?.records[indexPath.row].fields.orderDrink)!)", message:"確定要刪除這杯飲料嗎？", preferredStyle: .alert)
            //點選OK確定刪除鍵
            let okAction = UIAlertAction(title: "OK", style: .default){_ in
                
                //抓取要刪除資料的ID
                let url = URL(string: "https://api.airtable.com/v0/appsKrUpxDjeA04cU/order"+"/"+(self.orderData?.records[indexPath.row].id)!)!
                var request = URLRequest(url: url)
                request.httpMethod = "DELETE"
                request.setValue("Bearer key4MJhNePdp5IyUC", forHTTPHeaderField: "Authorization")
                URLSession.shared.dataTask(with: request) { data, response, error in
                    
                    if let response = response as? HTTPURLResponse,
                       response.statusCode == 200,
                       error == nil{
                        print("success")
                        
                        //執行tableview的刪除列、更新杯數、訂單數
                        DispatchQueue.main.async { [self] in

                            self.tableView.deleteRows(at: [indexPath], with: .fade)
                            self.totalCupLabel.text = "\(self.orderData?.records.count ?? 0)"
                        }
                        
                    }
                    
                }.resume()
                
                // 刪除後台訂購單的資料列
                self.orderData?.records.remove(at: indexPath.row)
            }
            // 加入 Alert 選項（ok 、 cancel）
            controller.addAction(okAction)
            controller.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            
            present(controller, animated: true, completion: nil)

        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
