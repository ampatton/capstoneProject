//
//  ShoppingCartViewController.swift
//  CafeApp2
//
//  Created by Austin Patton on 11/27/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import UIKit

struct unhealthyShoppingCart{
    static var foodsInCart = " " //this data is in a struct so it will persist when a new view controller is accessed. also, i dont want to make a singleton just for this
    static var timeToOrder = 0
}

class ShoppingCartViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(unhealthyShoppingCart.foodsInCart)

        textView.text = unhealthyShoppingCart.foodsInCart
        textView.isEditable = false
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearCartPressed(_ sender: Any) {
        textView.text = " "
        unhealthyShoppingCart.foodsInCart = " "
        unhealthyShoppingCart.timeToOrder = 0
    }
    

    @IBAction func returnToMenu(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
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
