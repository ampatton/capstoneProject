//
//  ShoppingCartViewController.swift
//  CafeApp2
//
//  Created by Austin Patton on 11/27/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var foodsInCart = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(foodsInCart)

        textView.text = foodsInCart
        textView.isEditable = false
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearCartPressed(_ sender: Any) {
        textView.text = " "
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
