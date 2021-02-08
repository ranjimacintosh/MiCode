//
//  CartViewController.swift
//  ScanMishCode
//
//  Created by JJ on 08/02/21.
//  Copyright © 2021 John. All rights reserved.
//

import UIKit
import CoreData

@available(iOS 13.0, *)
class CartViewController: UIViewController {
    
@IBOutlet weak var tableView: UITableView!
    
var cartDataMod = [NSManagedObject]()
var objectContext: NSManagedObjectContext! = nil
var entity: NSEntityDescription! = nil


// alert must be within the view to keep it in scope, when added to the Window

override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//        objectContext = appDelegate.persistentContainer.viewContext
//        entity = NSEntityDescription.entity(forEntityName: Constants.entityName, in: objectContext)!
        
        self.retrieveData()
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    func retrieveData() {
        
        //We need to create a context from this container
        let managedContext = CoreDataStack.sharedInstance.persistentContainer.viewContext
        
        //Prepare the request of type NSFetchRequest  for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cart")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            print("result\(result)")
            self.cartDataMod = result as! [NSManagedObject]
            
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "productName") as! String)
               
            }
            
            self.tableView.reloadData()
        } catch {
            
            print("Failed")
        }
    }
}

@available(iOS 13.0, *)
extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartDataMod.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = cartDataMod[indexPath.row].value(forKeyPath: "productName") as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let task = cartDataMod[indexPath.row]
            cartDataMod.remove(at: indexPath.row)
            objectContext.delete(task)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
