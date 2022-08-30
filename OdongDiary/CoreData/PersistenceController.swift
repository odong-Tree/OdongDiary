//
//  PersistenceController.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/30.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
//    private let entityName = "DiaryMO"
    
    let container: NSPersistentContainer
    
//    lazy var list: [NSManagedObject] = {
//        return self.fetch()
//    }()
    
    private init() {
        container = NSPersistentContainer(name: "Diary")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
    }
    
//    private func saveContext() {
//        let context = CoreDataManager.shared.container.viewContext
//
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
//
//    private func fetch() -> [NSManagedObject] {
//        let context = CoreDataManager.shared.container.viewContext
//
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
//
//        do {
//            let result = try context.fetch(fetchRequest)
//
//            return result
//        } catch {
//            print(error.localizedDescription)
//            return []
//        }
//
//    }
//
//    private func fetch(of id: String) -> NSManagedObject {
//        let context = CoreDataManager.shared.container.viewContext
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
//        let predicate = NSPredicate(format: "id = %@", id)
//        fetchRequest.predicate = predicate
//
//        do {
//            guard let result = try context.fetch(fetchRequest).first else {
//                return NSManagedObject()
//            }
//
//            return result
//        } catch  {
//            print(error.localizedDescription)
//            return NSManagedObject()
//        }
//    }
//
//    func save(_ diary: Diary) -> Bool {
//        let context = CoreDataManager.shared.container.viewContext
//        let object = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context)
//        object.setValue(diary.id, forKey: "id")
//        object.setValue(diary.videoURL, forKey: "videoURL")
//        object.setValue(diary.title, forKey: "title")
//        object.setValue(diary.body, forKey: "body")
//        object.setValue(diary.date, forKey: "date")
//
//        do {
//            try context.save()
//            self.list.append(object)
//            return true
//        } catch {
//            context.rollback()
//            return false
//        }
//    }
//
//    func update(_ diary: Diary) -> Bool {
//        let context = CoreDataManager.shared.container.viewContext
//        let object = self.fetch(of: diary.id)
//        object.setValue(diary.videoURL, forKey: "videoURL")
//        object.setValue(diary.title, forKey: "title")
//        object.setValue(diary.body, forKey: "body")
//        object.setValue(diary.date, forKey: "date")
//
//        do {
//            try context.save()
//            return true
//        } catch {
//            context.rollback()
//            return false
//        }
//    }
//
//    func delete(_ diary: Diary) -> Bool {
//        let context = CoreDataManager.shared.container.viewContext
//        let object = self.fetch(of: diary.id)
//        context.delete(object)
//
//        do {
//            try context.save()
//            return true
//        } catch {
//            context.rollback()
//            return false
//        }
//    }
}
