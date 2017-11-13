//
//  ViewController.swift
//  CafeApp2
//
//  Created by Austin Patton on 10/26/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import UIKit

class UnhealthyViewController: UIViewController {

    @IBOutlet weak var testTextLabel: UILabel!
    
    @IBOutlet weak var testTextButton: UIButton!
    
    
    var testText = "wrong text"
    
    //var testFood = "Wrong  food"   --Uncomment if you need these for text labels instead of one text field--
    //var testDescription = "Wrong description"
    var testPrice = "Wrong price"
    
    var unhealthyItem1 = MenuItem(name: "wrong name", description: "wrong description", image: UIImage(), price: 9.99, timeStore: 0)
    
    @IBOutlet weak var timerLabelTest: UILabel!
    
    var seconds = 0
    var timer = Timer()
    var isTimeRunning = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        runTimer()
        
         testTextLabel?.text = testText
        testTextButton.setTitle(testPrice, for: .normal)
        
        self.title = "Menu Item Display"
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func updateTimer() {
        seconds += 1
        timerLabelTest.text = "\(seconds)"
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(UnhealthyViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        unhealthyItem1.timeStore = seconds
        print(seconds)       //These print statements are just to test that the right data is being recorded
        print(unhealthyItem1.description)
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
    

}

