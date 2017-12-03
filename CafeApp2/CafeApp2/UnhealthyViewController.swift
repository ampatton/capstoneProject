//
//  ViewController.swift
//  CafeApp2
//
//  Created by Austin Patton on 10/26/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import UIKit

class UnhealthyViewController: UIViewController {
    
    @IBOutlet weak var testTextButton: UIButton!
    @IBOutlet weak var testTextView: UITextView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    
    //    let section = ["Soups and Salads", "Sides", "Wraps", "Sandwiches", "Grill"]
    //creates the sections for the food items
    //    let foodItems = [[loadSoupsSalads], [loadSides]]
    //need to figure out how to grab the food items from each section.
    
    var testText = "wrong text"//use this if you go back to using a whole text view for all of them instead of labels
    var testFood = "Wrong  food"
    var testDescription = "Wrong description"
    var testPrice = "Wrong price"
    
    var unhealthyItem1 = MenuItem(name: "wrong name", description: "wrong description", image: UIImage(), price: 9.99, timeStore: 0)
    
    
    var seconds = 0
    var timer = Timer()
    var isTimeRunning = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        runTimer()
        foodNameLabel.text = testFood
        foodPriceLabel.text = testPrice
        testTextView?.text = testDescription
        
        self.title = "Menu Item Display"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func updateTimer() {
        seconds += 1
        //timerLabelTest.text = "\(seconds)" in case you need a label that displays the time
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(UnhealthyViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let viewController = segue.destination as! UnhealthyShoppingCartViewController
     unhealthyShoppingCart.foodsInCart.append(testFood + "\n Price " + testPrice + "\n\n")
        unhealthyShoppingCart.timeToOrder += seconds
        //pretty sure you still need a prepareForSegue so you can get the proper time from the timer (need the time when the segue is pressed)
        
        
        
        print("Time for this page: " + seconds.description + "\nTime for total pages on this order:" + unhealthyShoppingCart.timeToOrder.description)       //These print statements are just to test that the right data is being recorded
        //print(unhealthyItem1.description)
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
    
    
}



