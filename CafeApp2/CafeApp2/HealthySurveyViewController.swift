//
//  HealthySurveyViewController.swift
//  CafeApp2
//
//  Created by Austin Patton on 11/29/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import UIKit

class HealthySurveyViewController: UIViewController {

    var surveyBoolean: Bool = false  //In case the owner wants to prevent them from finishing without taking the survey

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    @IBAction func surveyButtonPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://missouri.qualtrics.com/jfe/form/SV_0rEzTGyFxy6ccVn")! as URL, options: [:], completionHandler: nil)
        surveyBoolean = true
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
