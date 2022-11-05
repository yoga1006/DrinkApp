//
//  MenuTableViewController.swift
//  DrinkApp
//
//  Created by Yoga on 2022/11/5.
//

import UIKit

var airtableUrl = "https://api.airtable.com/v0/appsKrUpxDjeA04cU/Projects"
var apiKey = "Bearer key4MJhNePdp5IyUC"
var httpHeaderField = "Authorization"
 

class MenuTableViewController: UITableViewController {
    var drinkData : DrinkData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getDrinkData()
        
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
        return drinkData?.records.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MenuTableViewCell.self)", for: indexPath)as! MenuTableViewCell
        let data = drinkData?.records[indexPath.row].fields
        cell.drinkName.text = data?.name
        cell.drinkCountry.text = data?.country
        cell.drinkDescription.text = data?.description

        return cell
    }
    
    func getDrinkData(){
        
        if let url = URL(string: airtableUrl){
            var request = URLRequest(url: url)
            request.httpMethod = "Get"
            request.setValue(apiKey, forHTTPHeaderField: httpHeaderField)
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let data = data {
                    let decoder = JSONDecoder()
                    
                    do{
                        let dataResponse = try decoder.decode(DrinkData.self, from: data)
                        self.drinkData = dataResponse
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
