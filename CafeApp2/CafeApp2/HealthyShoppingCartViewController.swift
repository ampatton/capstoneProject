//
//  HealthyShoppingCartViewController.swift
//  CafeApp2
//
//  Created by Austin Patton on 11/29/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import UIKit

struct healthyShoppingCart{
    static var foodsInCart = " " //this data is in a struct so it will persist when a new view controller is accessed. also, i dont want to make a singleton just for this
    static var timeToOrder = 0
}

class HealthyShoppingCartViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        textView.text = healthyShoppingCart.foodsInCart
        textView.isEditable = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func returnToMenu(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)//i dont really understand how this works, but it does
    }
    
    
    @IBAction func clearCart(_ sender: Any) {
        textView.text = " "
        healthyShoppingCart.foodsInCart = " "
        healthyShoppingCart.timeToOrder = 0
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
