//
//  HealthyViewController.swift
//  CafeApp2
//
//  Created by Austin Patton on 11/2/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import UIKit

class HealthyViewController: UIViewController {
    
    
   // @IBOutlet weak var testTextView: UITextView!
    @IBOutlet weak var testTextView: UITextView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var foodCalorieLabel: UILabel!
    @IBOutlet weak var foodCarbLabel: UILabel!
    @IBOutlet weak var foodFatLabel: UILabel!
    @IBOutlet weak var foodCholesteralLabel: UILabel!
    @IBOutlet weak var foodSodiumLabel: UILabel!
    @IBOutlet weak var foodProteinLabel: UILabel!
    @IBOutlet weak var testDescriptionLabel: UILabel!
    
    //connect these for the healthy menu. going to need to segue to the TVC
    
    var testText = "blank"
    var testFood = "Wrong  food"  // --Uncomment if you need these for text labels instead of one text field--
    var testDescription = "Wrong description"
    var testPrice = "Wrong price"
    var testCalories = "Wrong Calories"
    var testCarbohydrates = "Wrong Carbs"
    var testFats = "Wrong Fats"
    var testCholesteral = "Wrong Cholesteral"
    var testSodium = "Wrong Sodium"
    var testProtein = "Wrong Protein"
    
    var seconds = 0
    var timer = Timer()
    var isTimeRunning = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1)//makes sure the color of the buy button stays blue
        testTextView?.text = testDescription
        foodNameLabel?.text = testFood
        foodPriceLabel?.text = testPrice
        foodCalorieLabel?.text = testCalories
        foodCarbLabel?.text = testCarbohydrates
        foodFatLabel?.text = testFats
        foodCholesteralLabel?.text = testCholesteral
        foodSodiumLabel?.text = testSodium
        foodProteinLabel?.text = testProtein
        //connecting the label to the content
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func updateTimer() {
        seconds += 1
        //timerLabelTest.text = "\(seconds)" currently dont have the label in the UI. Uncomment to display the time
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(UnhealthyViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let viewController = segue.destination as! HealthyShoppingCartViewController
        healthyShoppingCart.foodsInCart.append(testFood + "\n Price " + testPrice + "\n\n")
        healthyShoppingCart.timeToOrder += seconds
        
        //pretty sure you still need a prepareForSegue so you can get the proper time from the timer (need the time when the segue is pressed)
        
        
        
        print("Time for this page: " + seconds.description + "\nTime for total pages on this order:" + healthyShoppingCart.timeToOrder.description)       //These print statements are just to test that the right data is being recorded
        //print(unhealthyItem1.description)
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
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
