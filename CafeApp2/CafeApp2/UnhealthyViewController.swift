//
//  ViewController.swift
//  CafeApp2
//
//  Created by Austin Patton on 10/26/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import UIKit
import MessageUI

class UnhealthyViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var testTextLabel: UILabel!
    
    @IBOutlet weak var testTextButton: UIButton!
    
    @IBOutlet weak var timerLabelTest: UILabel!
    
    var testText = "wrong text"
    //var testFood = "Wrong  food"   --Uncomment if you need these for text labels instead of one text field--
    //var testDescription = "Wrong description"
    var testPrice = "Wrong price"
    
    var unhealthyItem1 = MenuItem(name: "wrong name", description: "wrong description", image: UIImage(), price: 9.99, timeStore: 0)
    
    
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
        
        let mailComposeViewController = configuredMailComposeViewController()
        
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["austinpatton59@gmail.com"])
        mailComposerVC.setSubject("New Order")
        mailComposerVC.setMessageBody("This is an example", isHTML: false)
        //is it posssible to make the messageBody read only?
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could not send order e-mail", message: "This device could not send the e-mail", delegate: self, cancelButtonTitle: "Ok")
        sendMailErrorAlert.show()
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        
    }

}

    
    
    




