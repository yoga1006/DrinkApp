//
//  ShoppingcartTableViewController.swift
//  DrinkApp
//
//  Created by Yoga on 2022/12/3.
//

import UIKit

//飲料總訂購單
class ShoppingcartTableViewController: UITableViewController {
    
    
    
    @IBOutlet weak var cupTotalLabel: UILabel!
    
    @IBOutlet weak var sumTotalLabel: UILabel!
    
    var orderData:OrderResponse?
    var orderInfo=[Records]()
    
    //抓取總訂購單資料
    func fetchOrderData() {
        
        let url = URL(string: "https://api.airtable.com/v0/appsKrUpxDjeA04cU/order")!
        var request = URLRequest(url: url)
        
        request.setValue("Bearer key4MJhNePdp5IyUC", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            let decoder = JSONDecoder()
            
            if let data = data{
                do {
                    self.orderData = try decoder.decode(OrderResponse.self, from: data)
                    DispatchQueue.main.async {
                        
                        self.orderInfo = self.orderData!.records
                        
                    }
                } catch  {
                    print(error)
                }
            }
        }.resume()
    }
    
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
        return orderInfo.count
    }

    //訂購單資料放入自訂 Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.rowHeight = 170  //調整cell的大小
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ShoppingcartTableViewCell.self)", for: indexPath)as! ShoppingcartTableViewCell

        let data = orderData?.records[indexPath.row].fields
        
        cell.finalNameLabel.text = data?.orderName
        cell.finalDrinkLabel.text = data?.orderDrink

       
        return cell
    
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
