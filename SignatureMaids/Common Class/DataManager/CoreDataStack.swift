//  CoreDataStack.swift
//  SignatureMaids
//  Created by admin on 21/12/20.
//  Copyright © 2020 Chetu. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataStack : NSObject{
    static let sharedInstance = CoreDataStack()
    private override init() {}
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SignatureMaids")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            print(storeDescription)
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    /// Method for get the record from table
    /// - Parameter entityName: name the table
    /// - Parameter predicate: predicate to filter data
    /// - Parameter sortDescriptors: order to result
    /// - Parameter handler: handler triggered with records and Status
    func getData(entityName: String, predicate: NSPredicate?, sortDescriptors: NSSortDescriptor?, withCompletionHandler handler: @escaping (_ dict:[Any]?, _ isSuccessful: Bool) -> Void) {
            let dataManager = CoreDataStack.sharedInstance
        let context = dataManager.persistentContainer.viewContext
            let request: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            if let predicate = predicate {
            request.predicate = predicate
        }
            if let sortDescriptors = sortDescriptors {
            request.sortDescriptors = [sortDescriptors]
        }
            request.returnsObjectsAsFaults = false
        do {
            let arrayOfData = try context.fetch(request)
                    handler(arrayOfData,true)
        } catch {
            // Handle the error!
            debugPrint(error)
            handler(nil,false)
        }
    }
  
    /// Method for delete the  record from table
    /// - Parameter entity: name the table
    /// - Parameter predicate: predicate to filter data
    /// - Parameter handler: handler triggered with status and message
    func deleteData(_ entity:String, predicate: NSPredicate?, withCompletionHandler handler: @escaping (_ isSuccessful: Bool , _ message: String) -> Void) {
        let dataManager = CoreDataStack.sharedInstance
        let context = dataManager.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        if let predicate = predicate {
            fetchRequest.predicate = predicate
        }
        fetchRequest.returnsObjectsAsFaults = false
        let results = try! context.fetch(fetchRequest)
        if results.count != 0{
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                context.delete(objectData)
            }
            do {
                try context.save()
                debugPrint("Delete Row")
                handler(true,"Delete")// <- remember to put this :)
            } catch {
                debugPrint("Failed delete row")
                handler(false,"Failed")
            }
        }else{
            debugPrint("Failed to delete row")
            handler(false,"Failed")
        }
    }
}


