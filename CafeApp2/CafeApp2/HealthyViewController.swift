//
//  HealthyViewController.swift
//  CafeApp2
//
//  Created by Austin Patton on 11/2/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class HealthyViewController: UIViewController {
    
    
    @IBOutlet weak var testTextLabel: UILabel!
    
    var testText = "blank"
    
    //var ref:DatabaseReference?
    //var databaseHandle:DatabaseHandle?
    
    
    var postData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testTextLabel?.text = testText
        self.title = "Menu Item Display"
    
        
        //set the firebase reference
        //ref = Database.database().reference()
        
        //retrieve the posts and listen for changes
       //databaseHandle = ref?.child("Posts").observe(.childAdded, with: { (snapshot) in
            
            //Code to execute when a child is added under "Posts"
            //Take the value from the snapshot and added it to the postData array
            //self.postData.append("")
            
        
        //})
        
        // Do any additional setup after loading the view.
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
