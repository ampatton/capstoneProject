//
//  HealthyViewController.swift
//  CafeApp2
//
//  Created by Austin Patton on 11/2/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import UIKit

class HealthyViewController: UIViewController {
    
    
    @IBOutlet weak var testTextView: UITextView!
    
    var testText = "blank"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testTextView?.text = testText
        self.title = "Menu Item Display"
        
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
