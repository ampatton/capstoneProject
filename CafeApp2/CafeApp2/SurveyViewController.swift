//
//  SurveyViewController.swift
//  CafeApp2
//
//  Created by Austin Patton on 11/9/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {
    var surveyResult = SurveyItem(satisfaction: false, timelyManner: false, comments: "Invalid")

    @IBOutlet weak var satisfactionButton: UISwitch!
    
    @IBOutlet weak var timeButton: UISwitch!
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        if (timeButton.isOn == true){
            surveyResult.timelyManner = true
        }
        else{
            surveyResult.timelyManner = false
        }
        
        if (satisfactionButton.isOn == true){
            surveyResult.satisfaction = true
        }
        else {
            surveyResult.satisfaction = false
        }
        print(surveyResult.timelyManner)
        print(surveyResult.satisfaction)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Survey"
        
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
