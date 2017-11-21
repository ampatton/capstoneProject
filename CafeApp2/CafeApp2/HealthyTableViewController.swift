//
//  HealthyTableViewController.swift
//  CafeApp2
//
//  Created by Austin Patton on 10/26/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class healthyMenuCell: UITableViewCell{
    
    @IBOutlet weak var healthyTextView: UITextView!
    
    
}

class HealthyTableViewController: UITableViewController {

    //var postData = [Any]()
    
    struct drinkStruct{
        let name : String!
        let price : Float!
    }
    
    var menu = Array<MenuItem>()
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    let posts = [post]
    
    var healthy = Array<MenuItem>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var healthyItem1 = MenuItem(name: "pancakes", description: "Light and fluffy", image: UIImage(), price: 9, timeStore: 0)
        self.title = "Cafe at Eckles Menu"
        healthy.append(healthyItem1)
        
    
        ref = Database.database().reference()
        
        //retrieve the posts and listen for changes
        ref?.child("menu_items").child("Drinks").child("coffee").observeSingleEvent(of: .value, with: { (snapshot) in
        
            //Code to execute when a child is added under "Posts"
            //Take the value from the snapshot and added it to the postData array
            print (snapshot)
            
            //let name = snapshot.value!["name"] as! String
            //let price = snapshot.value!["price"] as! Float
            
            //self.posts.insert(drinkStruct(name: name, price: price) , atIndex:0)
            
            //let name = snapshot.value?["name"] as? String ?? ""
            
            //self.menu.append(snapshot.value as! MenuItem)
            
            
            })
        
        
            /*if let actualPost = postHere {
            self.postData.append(actualPost)
         
                self.tableView.reloadData()
            }*/
            
        //})

        
        
        
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //post()
    }
    
    func post(){
        
        let title = "Title"
        let message = "Message"
        
        let post : [String : AnyObject] = ["title" : title as AnyObject, "message" : message as AnyObject]
        
        let databaseRef = Database.database().reference()
        
        databaseRef.child("Posts").childByAutoId().setValue(post)
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
        
        //return postData.count
        
     //menu.count
        
        return healthy.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "healthyMenuChoiceCell", for: indexPath) as! healthyMenuCell
        
        var priceDoubleConversion = String(healthy[indexPath.row].price)

         cell.healthyTextView.isEditable = false
        
        cell.healthyTextView?.text = "Name: " + healthy[indexPath.row].name + "\n Description: " + healthy[indexPath.row].description + "\n Price: " + priceDoubleConversion
        return cell
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        let cell = sender as! UITableViewCell
        let indexPath = self.tableView.indexPath(for: cell)
        
        let food = healthy[indexPath!.row].name
        let description = healthy[indexPath!.row].description
        let price = String(healthy[indexPath!.row].price)
        
        
        let viewController = segue.destination as! HealthyViewController
        viewController.testText = food + "\n Description: " + description + "\n Price " + price
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
