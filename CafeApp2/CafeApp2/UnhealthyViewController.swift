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
    
    var testFood = "Wrong  food"
    var testDescription = "Wrong description"
    var testPrice = "Wrong price"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         testTextLabel?.text = testText
        testTextButton.setTitle(testPrice, for: .normal)
        
        self.title = "Menu Item Display"
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

