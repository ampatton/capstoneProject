//
//  HealthyViewController.swift
//  CafeApp2
//
//  Created by Austin Patton on 11/2/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import UIKit

class HealthyViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var testTextView: UITextView!
    
    var testText = "blank"
    var testFood = "Wrong  food"  // --Uncomment if you need these for text labels instead of one text field--
    var testDescription = "Wrong description"
    var testPrice = "Wrong price"
    var testPic = "blank"
    
    var seconds = 0
    var timer = Timer()
    var isTimeRunning = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1)//makes sure the color of the buy button stays blue
        testTextView?.text = testText
        self.title = testFood
        
        /*if let filePath = Bundle.main.path(forResource: "imageName", ofType: "jpg"), let image = UIImage(contentsOfFile: filePath) {
         imageView.contentMode = .scaleAspectFit
         imageView.image = image
         }*/
        
        let catPictureURL = URL(string: testPic)
        
        let session = URLSession(configuration: .default)
        
        let downloadPicTask = session.dataTask(with: catPictureURL!) { (data,response, error) in
            
            if let e = error {
                print("Error download")
            }
            else{
                
                if let res = response as? HTTPURLResponse{
                    print("downloaded \(res.statusCode)")
                    if let imageData = data {
                        
                        let image = UIImage(data: imageData)
                        
                        self.imageView.image = image
                        
                    }else {
                        print("Couldn't get image")
                    }
                }else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
        
        downloadPicTask.resume()
        
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
