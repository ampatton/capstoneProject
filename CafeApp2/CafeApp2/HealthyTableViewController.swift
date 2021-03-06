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

struct DBConfigured {
     static var configuredBool: Bool = false //Needed to make it a struct so its global. Otherwise, when you go back to the table view controller after already being it it, it gets configured twice and crashes the program
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
    var pic = ""
    
    init(name: String, calories: Int, carbohydrate: Int, cholesterol: Int, description: String, fat: Int, price: Double, protein: Int, sodium: Int, pic: String) {
        self.name = name
        self.calories = calories
        self.carbohydrate = carbohydrate
        self.cholesterol = cholesterol
        self.description = description
        self.fat = fat
        self.price = price
        self.protein = protein
        self.sodium = sodium
        self.pic = pic
    }
    
    init(name: String, price: Double, pic: String) {
        self.name = name
        self.price = price
        self.pic = pic
    }
    

}

class HealthyTableViewController: UITableViewController {

    var drinks = [drinkStruct]()
    private var menuItems = [menuItemStruct]()
    var arrayIndex = Int()
    var ref:DatabaseReference?
    
    //var dictionaryArray = [[String: AnyObject]]()
    
    let section = ["Soups and Salads", "Sides", "Wraps", "Sandwiches", "Grill"]
    let foodItems = [[loadSoupsSalads], [loadSides], [loadWraps], [loadSandwiches], [loadGrill]]
    //checked w/ print statement and it loads as "[[(Function)], [(Function)]...etc]
    //need to figure out a way to grab the items from each function rather than just calling the whole function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(DBConfigured.configuredBool == false){
            FirebaseApp.configure()
            DBConfigured.configuredBool = true
        }
        
        self.title = "Cafe Eckles Menu"//self.pop to root navigation controller
        
        
   self.loadDrinks(completionHandler: { items in
            self.menuItems += items
        self.loadSoupsSalads(completionHandler: { items in
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
    })
        
        /*loadSoupsSalads(completionHandler: { items in
            self.menuItems += items
        })*/
        
        /*loadSides(completionHandler: { items in
            self.menuItems += items
        })*/
        
        
        
        
        
        //printArray(completion:loadSandwiches()) //dont understand why im getting an error here. It returns void and has void parameters
        
        //loadDrinks()
        //loadSides()You can load all of the items this way without completion handlers. However, they will be randomly ordered
        //loadGrill()
        //loadWraps()
        //loadSandwiches()
        //loadSoupsSalads()
        
        //printArray()
    
    
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
    
    func printArray(completion: ()->()){
         completion()
         print("THIS IS THE ARRAYS CONTENTS --------------\n\n")//this is for an in progress way to add sections to the device
        
        for menuItemStruct in menuItems{
        print(menuItemStruct)
        }
    }
    
    func loadDrinks (completionHandler: @escaping ([menuItemStruct]) -> Void){//<--------------------Once the database is fixed, take out coffee so it reads the drinks category
        ref = Database.database().reference()
        
        var items: [menuItemStruct] = []
        
        ref?.child("menu_items").child("Drinks").observeSingleEvent(of: .value, with: {(snapshot) in
            print (snapshot)
            
            for (key, dict) in snapshot.value as? NSDictionary ?? [:] {
                let dict = dict as? NSDictionary
                
                let calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, name = dict!["name"] as? String, price = dict!["price"] as? Double, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int, pic = dict?["pic"] as? String
                
                
                items.append(menuItemStruct(name: name!, price: price!, pic: pic!))//snapshot will read in calories and the other values that arent included in this one as nil since they're not in the database. That's why there's another initializer which is specifically only for drinks since it only initializes name, price, and pic while everything else is set to zero or " "
                //self.arrayIndex += 1
                
                
            }
            //let name = snapshot.value!["name"]
            
            completionHandler(items)
            
            print("------------------------------------------------------")
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
                
                let calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, name = dict!["name"] as? String, price = dict!["price"] as? Double, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int, pic = dict?["pic"] as? String
                
                items.append(menuItemStruct(name: name!, calories: calories!, carbohydrate: carbohydrate!, cholesterol: cholesterol!, description: description!, fat: fat!, price: price!, protein: protein!, sodium: sodium!, pic: pic! ))
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
                
                let calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, name = dict!["name"] as? String, price = dict!["price"] as? Double, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int, pic = dict!["pic"] as? String
                
                items.append(menuItemStruct(name: name!, calories: calories!, carbohydrate: carbohydrate!, cholesterol: cholesterol!, description: description!, fat: fat!, price: price!, protein: protein!, sodium: sodium!, pic: pic! ))
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
                
                let calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, name = dict!["name"] as? String, price = dict!["price"] as? Double, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int, pic = dict!["pic"] as? String
                
                items.append(menuItemStruct(name: name!, calories: calories!, carbohydrate: carbohydrate!, cholesterol: cholesterol!, description: description!, fat: fat!, price: price!, protein: protein!, sodium: sodium!, pic: pic! ))
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
                
                let calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, name = dict!["name"] as? String, price = dict!["price"] as? Double, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int, pic = dict?["pic"] as? String
                
                items.append(menuItemStruct(name: name!, calories: calories!, carbohydrate: carbohydrate!, cholesterol: cholesterol!, description: description!, fat: fat!, price: price!, protein: protein!, sodium: sodium!, pic: (pic)! ))
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
                
                let calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, name = dict!["name"] as? String, price = dict!["price"] as? Double, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int, pic = dict!["pic"] as? String
                
                items.append(menuItemStruct(name: name!, calories: calories!, carbohydrate: carbohydrate!, cholesterol: cholesterol!, description: description!, fat: fat!, price: price!, protein: protein!, sodium: sodium!, pic: pic! ))
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
                
                let calories = dict!["calories"] as? Int, carbohydrate = dict!["carbohydrate"] as? Int, cholesterol = dict!["cholesterol"] as? Int, description = dict!["description"] as? String, fat = dict!["fat"] as? Int, name = dict!["name"] as? String, price = dict!["price"] as? Double, protein = dict!["protein"] as? Int, sodium = dict!["sodium"] as? Int, pic = dict!["pic"] as? String
                
                items.append(menuItemStruct(name: name!, calories: calories!, carbohydrate: carbohydrate!, cholesterol: cholesterol!, description: description!, fat: fat!, price: price!, protein: protein!, sodium: sodium!, pic: pic! ))
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


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       /* if section == 1 {
          return 3
        }
        else if section == 2 {
            return 3
        }
        else if section == 3 {
            return 2
        }
        else if section == 4 {
            return 4
        }
        else if section == 5{
            return 3
        }
        else if section == 6{
            return 1
        }
        else {
            return 0
        }*/
        
        
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
        viewController.testText = "Name: " + menuItems[indexPath!.row].name + "\nPrice: $" + menuItems[indexPath!.row].price.description + "\nDescription: " + menuItems[indexPath!.row].description + "\nCalories: " + menuItems[indexPath!.row].calories.description + "\nCarbohydrates: " + menuItems[indexPath!.row].carbohydrate.description + " grams\nFat: " + menuItems[indexPath!.row].fat.description + " grams\nCholesterol: " + menuItems[indexPath!.row].cholesterol.description + " grams\nSodium: " + menuItems[indexPath!.row].sodium.description + " grams\nProtein: " + menuItems[indexPath!.row].protein.description + " grams"
        
        
        viewController.testFood = menuItems[indexPath!.row].name
        viewController.testDescription = menuItems[indexPath!.row].description
        viewController.testPrice = menuItems[indexPath!.row].price.description
        viewController.testCalories = menuItems[indexPath!.row].calories.description
        viewController.testCarbohydrates = menuItems[indexPath!.row].carbohydrate.description
        viewController.testFats = menuItems[indexPath!.row].fat.description
        viewController.testCholesteral = menuItems[indexPath!.row].cholesterol.description
        viewController.testSodium = menuItems[indexPath!.row].sodium.description
        viewController.testProtein = menuItems[indexPath!.row].protein.description
        viewController.testPic = menuItems[indexPath!.row].pic
        //labels for switch between textbox to label controls
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
