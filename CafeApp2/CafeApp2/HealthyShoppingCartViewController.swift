//
//  HealthyShoppingCartViewController.swift
//  CafeApp2
//
//  Created by Austin Patton on 11/29/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import UIKit
import MessageUI

struct healthyShoppingCart{
    static var foodsInCart = " " //this data is in a struct so it will persist when a new view controller is accessed. also, i dont want to make a singleton just for this
    static var timeToOrder = 0
}

class HealthyShoppingCartViewController: UIViewController, MFMailComposeViewControllerDelegate {

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
        mailComposerVC.setToRecipients(["austinpatton59@gmail.com"])
        mailComposerVC.setSubject("New Order")
        mailComposerVC.setMessageBody(healthyShoppingCart.foodsInCart + "Total time spent analyzing:" + unhealthyShoppingCart.timeToOrder.description, isHTML: false)
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
