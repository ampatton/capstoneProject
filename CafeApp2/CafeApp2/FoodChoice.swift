//
//  FoodChoice.swift
//  CafeApp2
//
//  Created by John Hayden on 11/21/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import Foundation

struct FoodChoice{
    
    var name = String()
    var description = String()
    var image = UIImage()
    var price = Double()
    var timeStore = Int()
    
    let firebaseReference: DatabaseReference?
    var completed: Bool
    stat let kTaskUserKey = "user"
    
    init (name: String, description: String, image: UIImage, price: Double, timeStore: Int, completed: Bool, id: String = ""){
        self.name = name
        self.description = description
        self.image = UIImage()
        self.price = price
        self.timeStore = timeStore
        self.completed = completed
        self.firebaseReference = nil
    }
    
    init(snapshot: DataSnapshot)
    {
        let snapshotValue = snapshot.value as! [String:Any]
        self.title = snapshotValue[FoodChoice.name] as! String
        self.description = snapshot
    }
}
