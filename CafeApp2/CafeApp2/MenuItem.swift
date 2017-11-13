//
//  MenuItem.swift
//  CafeApp2
//
//  Created by Austin Patton on 10/26/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import Foundation
import UIKit

class MenuItem {
    
    var name = String()
    var description = String()
    var image = UIImage()
    var price = Double()
    
    init (name: String, description: String, image: UIImage, price: Double){
        self.name = name
        self.description = description
        self.image = UIImage()
        self.price = price
    }
    
}
