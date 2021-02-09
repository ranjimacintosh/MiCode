//
//  Cart+CoreDataProperties.swift
//  ScanMishCode
//
//  Created by JJ on 08/02/21.
//  Copyright © 2021 John. All rights reserved.
//
//

import Foundation
import CoreData


extension Cart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cart> {
        return NSFetchRequest<Cart>(entityName: "Cart")
    }

    @NSManaged public var productName: String?

}
