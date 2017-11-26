//
//  HealthyTableViewController.swift
//  CafeApp2
//
//  Created by Austin Patton on 10/26/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//
import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class healthyMenuCell: UITableViewCell{
    
    @IBOutlet weak var healthyTextView: UITextView!
    
    
}

struct drinkStruct{
    let name : String!
    let price : Float!
}

struct menuItemStruct{
    let name: String!
    let calories: Int!
    let carbohydrate: Int!
    let cholesterol: Int!
    let description: String!
    let fat: Int!
    let price: Float!
    let protein: Int!
    let sodium: Int!
}

class HealthyTableViewController: UITableViewController {

    var drinks = [drinkStruct]()
    var menuItems = [menuItemStruct]()
    
    var ref:DatabaseReference?
    var configuredBool: Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(configuredBool == false){
            FirebaseApp.configure()
            configuredBool = true
        }
        
        self.title = "Cafe at Eckles Menu"
        
        loadDrinks()
        loadMenuItems()
        
    

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        //post ()
    }
    
    func post(){
        let title = "Title"
        let message = "Message"
        
        let post : [String : AnyObject] = ["title" : title as AnyObject, "message" : message as AnyObject]
        
        let databaseRef = Database.database().reference()
        
        databaseRef.child("Posts").childByAutoId().setValue(post)
    }
    
    func loadDrinks () {
        ref = Database.database().reference()
        
        ref?.child("menu_items").child("Drinks").child("coffee").observeSingleEvent(of: .value, with: {(snapshot) in
            print (snapshot)
            //let name = snapshot.value!["name"]
            let dict = snapshot.value as? NSDictionary, name = dict!["name"] as? String, price = dict!["price"] as? Float
            
            
            print (dict)
            
            self.drinks.insert(drinkStruct(name: name, price: price ), at: 0)
            
            self.tableView.reloadData()
        })
    }
    
    func loadMenuItems(){
        ref = Database.database().reference()
        
        ref?.child("menu_items").child("Wraps").observeSingleEvent(of: .value, with: {(snapshot) in
            print (snapshot)
            var i = 0
            
            //let name = snapshot.value!["name"]
            let dict = snapshot.value as? NSDictionary, name = dict!["name"] as? String, calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, price = dict!["price"] as? Float, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int
            
            
            print (dict)
            
            self.menuItems.insert(menuItemStruct(name: name, calories: calories, carbohydrate: carbohydrate, cholesterol: cholesterol, description: description, fat: fat, price: price, protein: protein, sodium: sodium ), at: i)
            i += 1
            print("------------------------------------------------------")
            self.tableView.reloadData()
        })
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "healthyMenuChoiceCell", for: indexPath) as! healthyMenuCell

         cell.healthyTextView.isEditable = false
        
        cell.healthyTextView?.text = drinks[indexPath.row].name + " \n$ " + drinks[indexPath.row].price.description
        
        //cell.healthyTextView?.text = menuItems[indexPath.row].name + " \n$ " + menuItems[indexPath.row].price.description
        //menuItem array isnt getting data loaded in right. Not sure why
        
        //print(drinks[indexPath.row].price.description) just to test that you can print a float using description
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       let cell = sender as! UITableViewCell
        let indexPath = self.tableView.indexPath(for: cell)
        
        
        let viewController = segue.destination as! HealthyViewController
        viewController.testText = drinks[indexPath!.row].name + "\n$ " + drinks[indexPath!.row].price.description
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
