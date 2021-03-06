//
//  ShoppingCartViewController.swift
//  CafeApp2
//
//  Created by Austin Patton on 11/27/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import UIKit
import MessageUI
import Firebase

struct unhealthyShoppingCart{
    static var foodsInCart = " " //this data is in a struct so it will persist when a new view controller is accessed. also, i dont want to make a singleton just for this
    static var timeToOrder = 0
}

class UnhealthyShoppingCartViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var textView: UITextView!
    
    @IBAction func finalizeOrder(_ sender: Any) {
        
        if(FirebaseApp.app() == nil){
            FirebaseApp.configure()
        }
        
        let timeText = unhealthyShoppingCart.timeToOrder.description
        
        let text = textView.text
        let databaseRef = Database.database().reference()
        databaseRef.child("Customers").childByAutoId().setValue(text! + "Time Spent: " + timeText)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(unhealthyShoppingCart.foodsInCart)

        textView.text = unhealthyShoppingCart.foodsInCart
        textView.isEditable = false
        
        navigationItem.hidesBackButton = true // redundant with the "Return to menu" Button so removed
        
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
        //i dont really understand how this works, but it does
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let mailComposeViewController = configuredMailComposeViewController()
        
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could not send order e-mail", message: "This device could not send the e-mail", delegate: self, cancelButtonTitle: "Ok")
        sendMailErrorAlert.show()
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        
        mailComposerVC.mailComposeDelegate = self
        //  mailComposerVC.setEditing(false, animated: true) //possible way to disable the editing. will try to get back to it and figure
        mailComposerVC.setToRecipients(["lpresearchaa@mail.com", "lpresearchbb@mail.com"])
        mailComposerVC.setSubject("New Order")
        mailComposerVC.setMessageBody(unhealthyShoppingCart.foodsInCart + "Total time spent analyzing:" + unhealthyShoppingCart.timeToOrder.description, isHTML: false)
        //is it posssible to make the messageBody read only?
        
        return mailComposerVC
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        
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
