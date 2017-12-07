//
//  UnhealthyTableViewController.swift
//  CafeApp2
//
//  Created by Austin Patton on 10/26/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class unhealthyMenuCell: UITableViewCell{
    
    @IBOutlet weak var unhealthyTextView: UITextView!
}

class UnhealthyTableViewController: UITableViewController {

    
        /*var unhealthy = Array<MenuItem>()
        var unhealthyItem1 = MenuItem(name: "pancakes", description: "Light and fluffy", image: UIImage(), price: 9.99, timeStore: 999)
            var unhealthyItem2 = MenuItem(name: "Coffee", description: "black", image: UIImage(), price: 1.75, timeStore: 999)*/
    var drinks = [drinkStruct]()
    var menuItems = [menuItemStruct]()
    var arrayIndex = Int()
    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(DBConfigured.configuredBool == false){
            FirebaseApp.configure()
            DBConfigured.configuredBool = true
        }
        
        self.title = "Cafe Eckles Menu"//self.pop to root navigation controller
        
        loadSoupsSalads(completionHandler: { items in
            self.menuItems += items
            self.loadSides(completionHandler: { items in
                self.menuItems += items
                self.loadWraps(completionHandler: { items in
                    self.menuItems += items
                    self.loadSandwiches(completionHandler: { items in
                        self.menuItems += items
                        self.loadGrill(completionHandler: { items in
                            self.menuItems += items
                            self.loadOther(completionHandler: { items in
                                self.menuItems += items
                                self.tableView.reloadData()
                            })
                        })
                    })
                })
            })
        })
        
        
        /*loadDrinks()
        loadSides()//these arent getting called in order. Not sure why
        loadGrill()
        loadWraps()
        loadSandwiches()
        loadSoupsSalads()*/
        
        //printArray()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
    
    func loadSandwiches(completionHandler: @escaping ([menuItemStruct]) -> Void){//ALL OF THE MENU ITEMS HAVE THE SAME LOADING FUNCTIONS MINUS DRINKS (they just access a different child dictionary) WHICH IS WHY EACH DICTIONARY HAS TO HAVE ITS OWN FUNCTION
        ref = Database.database().reference()
        
        var items: [menuItemStruct] = []
        
        ref?.child("menu_items").child("sandwiches").observeSingleEvent(of: .value, with: {(snapshot) in
            print (snapshot)
            
            for (key, dict) in snapshot.value as? NSDictionary ?? [:] {
                let dict = dict as? NSDictionary
                
                let calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, name = dict!["name"] as? String, price = dict!["price"] as? Double, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int
                
                items.append(menuItemStruct(name: name!, calories: calories!, carbohydrate: carbohydrate!, cholesterol: cholesterol!, description: description!, fat: fat!, price: price!, protein: protein!, sodium: sodium! ))
                //self.arrayIndex += 1
                
                
            }
            //let name = snapshot.value!["name"]
            
            completionHandler(items)
            
            print("------------------------------------------------------")
            self.tableView.reloadData()
        })
    }
    
    func loadWraps(completionHandler: @escaping ([menuItemStruct]) -> Void){
        ref = Database.database().reference()
        
        var items: [menuItemStruct] = []
        
        ref?.child("menu_items").child("Wraps").observeSingleEvent(of: .value, with: {(snapshot) in
            print (snapshot)
            
            for (key, dict) in snapshot.value as? NSDictionary ?? [:] {
                let dict = dict as? NSDictionary
                
                let calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, name = dict!["name"] as? String, price = dict!["price"] as? Double, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int
                
                items.append(menuItemStruct(name: name!, calories: calories!, carbohydrate: carbohydrate!, cholesterol: cholesterol!, description: description!, fat: fat!, price: price!, protein: protein!, sodium: sodium! ))
                //self.arrayIndex += 1
            }
            //let name = snapshot.value!["name"]
            
            completionHandler(items)
            
            print("------------------------------------------------------")
            self.tableView.reloadData()
        })
    }
    
    func loadGrill(completionHandler: @escaping ([menuItemStruct]) -> Void){
        ref = Database.database().reference()
        
        var items: [menuItemStruct] = []
        
        ref?.child("menu_items").child("grill").observeSingleEvent(of: .value, with: {(snapshot) in
            print (snapshot)
            
            for (key, dict) in snapshot.value as? NSDictionary ?? [:] {
                let dict = dict as? NSDictionary
                
                let calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, name = dict!["name"] as? String, price = dict!["price"] as? Double, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int
                
                items.append(menuItemStruct(name: name!, calories: calories!, carbohydrate: carbohydrate!, cholesterol: cholesterol!, description: description!, fat: fat!, price: price!, protein: protein!, sodium: sodium! ))
                //self.arrayIndex += 1
            }
            //let name = snapshot.value!["name"]
            
            completionHandler(items)
            
            print("------------------------------------------------------")
            self.tableView.reloadData()
        })
    }
    
    func loadSoupsSalads(completionHandler: @escaping ([menuItemStruct]) -> Void){
        ref = Database.database().reference()
        
        var items: [menuItemStruct] = []
        
        ref?.child("menu_items").child("soups_salads").observeSingleEvent(of: .value, with: {(snapshot) in
            print (snapshot)
            
            for (key, dict) in snapshot.value as? NSDictionary ?? [:] {
                let dict = dict as? NSDictionary
                
                let calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, name = dict!["name"] as? String, price = dict!["price"] as? Double, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int
                
                items.append(menuItemStruct(name: name!, calories: calories!, carbohydrate: carbohydrate!, cholesterol: cholesterol!, description: description!, fat: fat!, price: price!, protein: protein!, sodium: sodium! ))
                //self.arrayIndex += 1
            }
            //let name = snapshot.value!["name"]
            
            
            completionHandler(items)
            
            print("------------------------------------------------------")
            self.tableView.reloadData()
        })
    }
    
    func loadSides(completionHandler: @escaping ([menuItemStruct]) -> Void){
        ref = Database.database().reference()
        
        var items: [menuItemStruct] = []
        
        ref?.child("menu_items").child("Sides").observeSingleEvent(of: .value, with: {(snapshot) in
            print (snapshot)
            
            for (key, dict) in snapshot.value as? NSDictionary ?? [:] {
                let dict = dict as? NSDictionary
                
                let calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, name = dict!["name"] as? String, price = dict!["price"] as? Double, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int
                
                items.append(menuItemStruct(name: name!, calories: calories!, carbohydrate: carbohydrate!, cholesterol: cholesterol!, description: description!, fat: fat!, price: price!, protein: protein!, sodium: sodium! ))
                //self.arrayIndex += 1
            }
            //let name = snapshot.value!["name"]
            
            
            completionHandler(items)
            
            print("------------------------------------------------------")
            self.tableView.reloadData()
        })
    }
    
    func loadOther(completionHandler: @escaping ([menuItemStruct]) -> Void){
        ref = Database.database().reference()
        
        var items: [menuItemStruct] = []
        
        ref?.child("menu_items").child("Other").observeSingleEvent(of: .value, with: {(snapshot) in
            print (snapshot)
            
            for (key, dict) in snapshot.value as? NSDictionary ?? [:] {
                let dict = dict as? NSDictionary
                
                let calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, name = dict!["name"] as? String, price = dict!["price"] as? Double, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int
                
                items.append(menuItemStruct(name: name!, calories: calories!, carbohydrate: carbohydrate!, cholesterol: cholesterol!, description: description!, fat: fat!, price: price!, protein: protein!, sodium: sodium! ))
                //self.arrayIndex += 1
            }
            //let name = snapshot.value!["name"]
            
            completionHandler(items)
            
            print("------------------------------------------------------")
            self.tableView.reloadData()
        })
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
        return menuItems.count
    }
    
    func post(){
        
        if(FirebaseApp.app() == nil){
             FirebaseApp.configure()
        }

        let title = "Swift Title"
        let message = "Swift message from Austin"
        let post : [String : AnyObject] = ["title" : title as AnyObject, "message" : message as AnyObject]
        
        let databaseRef = Database.database().reference()
        
        databaseRef.child("FirebaseTest").childByAutoId().setValue(post)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "unhealthyMenuChoiceCell", for: indexPath) as! unhealthyMenuCell
        
        cell.unhealthyTextView.isEditable = false
        cell.unhealthyTextView?.text = menuItems[indexPath.row].name + " \n$ " + menuItems[indexPath.row].price.description
        
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
        
        
        let viewController = segue.destination as! UnhealthyViewController
        //viewController.testText = drinks[indexPath!.row].name + "\n$ " + drinks[indexPath!.row].price.description
        
        viewController.testFood = menuItems[indexPath!.row].name
        viewController.testDescription = menuItems[indexPath!.row].description
        viewController.testPrice = menuItems[indexPath!.row].price.description
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
}
