//
//  NewHealth.swift
//  CafeApp2
//
//  Created by John Hayden on 11/22/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

struct drinkStruct{
    let name : String!
    let price : Float!
}


class newHealthViewController : UITableViewController {
    
    var drinks = [drinkStruct]()
    
    var ref:DatabaseReference?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        ref?.child("menu_items").child("Drinks").child("coffee").observeSingleEvent(of: .value, with: {(snapshot) in
            print (snapshot)
            //let name = snapshot.value!["name"]
            let dict = snapshot.value as? NSDictionary, name = dict!["name"] as? String, price = dict!["price"] as? Float
            
            
            
            self.drinks.insert(drinkStruct(name: name, price: price ), at: 0)
            
            self.tableView.reloadData()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return drinks.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let label1 = cell?.viewWithTag(1) as! UILabel
        label1.text = drinks[indexPath.row].name
        
        //var label2 = cell?.viewWithTag(2) as! UILabel
        //label2 = drinks[indexPath.row].price
        
        return cell!
    }
}
