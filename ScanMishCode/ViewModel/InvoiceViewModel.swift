//
//  InvoiceViewModel.swift
//  ScanMishCode
//
//  Created by JJ on 09/02/21.
//  Copyright © 2021 John. All rights reserved.
//

import Foundation
import CoreData

@available(iOS 13.0, *)
class InvoiceViewModel:NSObject {

    var invoiceDataMod = [NSManagedObject]()
    
    func getInvoiceData() {

        let managedContext = CoreDataStack.sharedInstance.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Invoice")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            print("result\(result)")
            self.invoiceDataMod = result as! [NSManagedObject]
        } catch {
            
            print("Failed")
        }
    }
}

