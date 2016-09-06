//
//  Cars.swift
//  MyFirstTableApp
//
//  Created by brb on 29.08.16.
//  Copyright © 2016 Andrey Tabachnikov. All rights reserved.
//

import Foundation
import CoreData

class Cars: NSManagedObject {
    
    @NSManaged var name: String!
    @NSManaged var address: String!
    @NSManaged var price : NSNumber!
    @NSManaged var image : NSData!
    
//    init(name: String, address: String, price: Int, image: String){
//        self.name = name
//        self.address = address
//        self.price = price
//        self.image = image
//    }
}