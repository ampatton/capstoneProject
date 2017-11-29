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
    let price : Double!
}

struct menuItemStruct{
    var name = ""
    var calories = 0
    var carbohydrate = 0
    var cholesterol = 0
    var description = ""
    var fat = 0
    var price = 0.0
    var protein = 0
    var sodium = 0
    
    init(name: String, calories: Int, carbohydrate: Int, cholesterol: Int, description: String, fat: Int, price: Double, protein: Int, sodium: Int) {
        self.name = name
        self.calories = calories
        self.carbohydrate = carbohydrate
        self.cholesterol = cholesterol
        self.description = description
        self.fat = fat
        self.price = price
        self.protein = protein
        self.sodium = sodium
    }
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
    

}

class HealthyTableViewController: UITableViewController {

    var drinks = [drinkStruct]()
    var menuItems = [menuItemStruct]()
    var arrayIndex = Int()
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
        loadSides()//these arent getting called in order. Not sure why
        loadGrill()
        loadWraps()
        loadSandwiches()
        loadSoupsSalads()
        
    

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
    
    func loadDrinks () {//<--------------------Once the database is fixed, take out coffee so it reads the drinks category
        ref = Database.database().reference()
        
        ref?.child("menu_items").child("Drinks").child("coffee").observeSingleEvent(of: .value, with: {(snapshot) in//takes a snapshot of the items within the database structure of menu_items - > Drinks -> what its taking a snapshot of
            print (snapshot)
            //let name = snapshot.value!["name"]
            let dict = snapshot.value as? NSDictionary, name = dict!["name"] as? String, price = dict!["price"] as? Double
            
            
            print (dict)
            
            self.menuItems.insert(menuItemStruct(name: name!, price: price!), at: self.arrayIndex)
            self.arrayIndex += 1
            //self.drinks.insert(drinkStruct(name: name, price: price ), at: 0)
            
            self.tableView.reloadData()
        })
    }
    
    func loadSandwiches(){//ALL OF THE MENU ITEMS HAVE THE SAME LOADING FUNCTIONS MINUS DRINKS (they just access a different child dictionary) WHICH IS WHY EACH DICTIONARY HAS TO HAVE ITS OWN FUNCTION
        ref = Database.database().reference()
        
        ref?.child("menu_items").child("sandwiches").observeSingleEvent(of: .value, with: {(snapshot) in
            print (snapshot)
            
            for (key, dict) in snapshot.value as? NSDictionary ?? [:] {
                let dict = dict as? NSDictionary
                
                let calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, name = dict!["name"] as? String, price = dict!["price"] as? Double, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int
                
                self.menuItems.insert(menuItemStruct(name: name!, calories: calories!, carbohydrate: carbohydrate!, cholesterol: cholesterol!, description: description!, fat: fat!, price: price!, protein: protein!, sodium: sodium! ), at: self.arrayIndex)
                self.arrayIndex += 1
            }
            //let name = snapshot.value!["name"]
            
            
            
            print("------------------------------------------------------")
            self.tableView.reloadData()
        })
    }
    
    func loadWraps(){
        ref = Database.database().reference()
        
        ref?.child("menu_items").child("Wraps").observeSingleEvent(of: .value, with: {(snapshot) in
            print (snapshot)
            
            for (key, dict) in snapshot.value as? NSDictionary ?? [:] {
                let dict = dict as? NSDictionary
                
                let calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, name = dict!["name"] as? String, price = dict!["price"] as? Double, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int
                
                self.menuItems.insert(menuItemStruct(name: name!, calories: calories!, carbohydrate: carbohydrate!, cholesterol: cholesterol!, description: description!, fat: fat!, price: price!, protein: protein!, sodium: sodium! ), at: self.arrayIndex)
                self.arrayIndex += 1
            }
            //let name = snapshot.value!["name"]
            
            
            
            print("------------------------------------------------------")
            self.tableView.reloadData()
        })
    }
    
    func loadGrill(){
        ref = Database.database().reference()
        
        ref?.child("menu_items").child("grill").observeSingleEvent(of: .value, with: {(snapshot) in
            print (snapshot)
            
            for (key, dict) in snapshot.value as? NSDictionary ?? [:] {
                let dict = dict as? NSDictionary
                
                let calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, name = dict!["name"] as? String, price = dict!["price"] as? Double, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int
                
                self.menuItems.insert(menuItemStruct(name: name!, calories: calories!, carbohydrate: carbohydrate!, cholesterol: cholesterol!, description: description!, fat: fat!, price: price!, protein: protein!, sodium: sodium! ), at: self.arrayIndex)
                self.arrayIndex += 1
            }
            //let name = snapshot.value!["name"]
            
            
            
            print("------------------------------------------------------")
            self.tableView.reloadData()
        })
    }
    
    func loadSoupsSalads(){
        ref = Database.database().reference()
        
        ref?.child("menu_items").child("soups_salads").observeSingleEvent(of: .value, with: {(snapshot) in
            print (snapshot)
            
            for (key, dict) in snapshot.value as? NSDictionary ?? [:] {
                let dict = dict as? NSDictionary
                
                let calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, name = dict!["name"] as? String, price = dict!["price"] as? Double, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int
                
                self.menuItems.insert(menuItemStruct(name: name!, calories: calories!, carbohydrate: carbohydrate!, cholesterol: cholesterol!, description: description!, fat: fat!, price: price!, protein: protein!, sodium: sodium! ), at: self.arrayIndex)
                self.arrayIndex += 1
            }
            //let name = snapshot.value!["name"]
            
            
            
            print("------------------------------------------------------")
            self.tableView.reloadData()
        })
    }
    
    func loadSides(){
        ref = Database.database().reference()
        
        ref?.child("menu_items").child("Sides").observeSingleEvent(of: .value, with: {(snapshot) in
            print (snapshot)
            
            for (key, dict) in snapshot.value as? NSDictionary ?? [:] {
                let dict = dict as? NSDictionary
                
                let calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, name = dict!["name"] as? String, price = dict!["price"] as? Double, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int
                
                self.menuItems.insert(menuItemStruct(name: name!, calories: calories!, carbohydrate: carbohydrate!, cholesterol: cholesterol!, description: description!, fat: fat!, price: price!, protein: protein!, sodium: sodium! ), at: self.arrayIndex)
                self.arrayIndex += 1
            }
            //let name = snapshot.value!["name"]
            
            
            
            print("------------------------------------------------------")
            self.tableView.reloadData()
        })
    }
    
    func loadOther(){
        ref = Database.database().reference()
        
        ref?.child("menu_items").child("Other").observeSingleEvent(of: .value, with: {(snapshot) in
            print (snapshot)
            
            for (key, dict) in snapshot.value as? NSDictionary ?? [:] {
                let dict = dict as? NSDictionary
                
                let calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, name = dict!["name"] as? String, price = dict!["price"] as? Double, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int
                
                self.menuItems.insert(menuItemStruct(name: name!, calories: calories!, carbohydrate: carbohydrate!, cholesterol: cholesterol!, description: description!, fat: fat!, price: price!, protein: protein!, sodium: sodium! ), at: self.arrayIndex)
                self.arrayIndex += 1
            }
            //let name = snapshot.value!["name"]
            
            
            
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
//        if section == 0 {
//            return 1
//        }
        
        return menuItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "healthyMenuChoiceCell", for: indexPath) as! healthyMenuCell

        
         cell.healthyTextView.isEditable = false
        cell.healthyTextView?.text = menuItems[indexPath.row].name + " \n$ " + menuItems[indexPath.row].price.description
       
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
        //viewController.testText = drinks[indexPath!.row].name + "\n$ " + drinks[indexPath!.row].price.description
        viewController.testText = menuItems[indexPath!.row].name + "\n$ " + menuItems[indexPath!.row].price.description
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
