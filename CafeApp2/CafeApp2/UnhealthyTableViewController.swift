//
//  UnhealthyTableViewController.swift
//  CafeApp2
//
//  Created by Austin Patton on 10/26/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import UIKit

class unhealthyMenuCell: UITableViewCell{
    
    @IBOutlet weak var unhealthyTextView: UITextView!
    
}

class UnhealthyTableViewController: UITableViewController {

        var unhealthy = Array<MenuItem>()
        var unhealthyItem1 = MenuItem(name: "pancakes", description: "Light and fluffy", image: UIImage(), price: 9.99, timeStore: 999)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cafe at Eckles Menu"
        
        
        unhealthy.append(unhealthyItem1)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return unhealthy.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "unhealthyMenuChoiceCell", for: indexPath) as! unhealthyMenuCell
        
        let priceDoubleConversion = String(unhealthy[indexPath.row].price)
        
        cell.unhealthyTextView?.text = "Name: " + unhealthy[indexPath.row].name + "\nDescription: " + unhealthy[indexPath.row].description + "\n Price: " + priceDoubleConversion
        
        cell.unhealthyTextView.isEditable = false
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = self.tableView.indexPath(for: cell)
        
        let food = unhealthy[indexPath!.row].name
        let description = unhealthy[indexPath!.row].description
        let price = String(unhealthy[indexPath!.row].price)
        
        
        let viewController = segue.destination as! UnhealthyViewController
        viewController.testText = food + "\n Description: " + description// + "\n Price " + price
        
        //viewController.testFood = food    --Uncomment if you need these for text labels instead of one text field--
        //viewController.testDescription = description
        viewController.testPrice = price
        
        viewController.unhealthyItem1 = unhealthyItem1
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
}
