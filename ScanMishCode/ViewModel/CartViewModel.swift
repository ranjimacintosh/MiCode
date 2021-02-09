//
//  CartViewModel.swift
//  ScanMishCode
//
//  Created by JJ on 08/02/21.
//  Copyright © 2021 John. All rights reserved.
//

import Foundation
import CoreData

@available(iOS 13.0, *)
class CartViewModel:NSObject {

    var cartDataMod = [NSManagedObject]()
    
    func getCartData() {

        let managedContext = CoreDataStack.sharedInstance.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cart")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            print("result\(result)")
            self.cartDataMod = result as! [NSManagedObject]
        } catch {
            
            print("Failed")
        }
    }
}

