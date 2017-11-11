//
//  SurveyItem.swift
//  CafeApp2
//
//  Created by Austin Patton on 11/9/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import Foundation
import UIKit

class SurveyItem{
    var satisfaction = Bool()
    var timelyManner = Bool()
    var comments = String()
    
    
    init(satisfaction: Bool, timelyManner:Bool, comments:String) {
        self.satisfaction = satisfaction
        self.timelyManner = timelyManner
        self.comments = comments
    }
}
