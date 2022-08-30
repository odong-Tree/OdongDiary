//
//  PersistenceController.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/30.
//

import Foundation
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    private let entityName = "Diary"
    
    let container: NSPersistentContainer
    
    lazy var list: [NSManagedObject] = {
        return self.fetch()
    }()
    
    private init() {
        container = NSPersistentContainer(name: entityName)
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
    }
    
    private func saveContext() {
        let context = CoreDataManager.shared.container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetch() -> [NSManagedObject] {
        let context = CoreDataManager.shared.container.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        let result = try! context.fetch(fetchRequest)
        
        return result
    }
    
    func save() -> Bool {
        let context = CoreDataManager.shared.container.viewContext
        let object = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context)
//        object.setValue
        
        do {
            try context.save()
            self.list.append(object)
            return true
        } catch {
            context.rollback()
            return false
        }
    }
    
    func update(object: NSManagedObject) -> Bool {
        let context = CoreDataManager.shared.container.viewContext
        //        object.setValue
        
        do {
            try context.save()
            return true
        } catch {
            context.rollback()
            return false
        }
    }
    
    func delete(object: NSManagedObject) -> Bool {
        let context = CoreDataManager.shared.container.viewContext
        
        context.delete(object)
        
        do {
            try context.save()
            return true
        } catch {
            context.rollback()
            return false
        }
    }
}
