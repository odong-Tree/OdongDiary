//
//  CoreDataManager.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/31.
//

import CoreData

struct CoreDataManager {
    static private let entityName = "Diary"
    private func saveContext(_ context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    static private func fetch(_ context: NSManagedObjectContext) -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        
        do {
            let result = try context.fetch(fetchRequest)
            
            return result
        } catch {
            print(error.localizedDescription)
            return []
        }
        
    }
    
    static func fetch(_ context: NSManagedObjectContext, of id: String) -> NSManagedObject {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        let predicate = NSPredicate(format: "id == %@", id)
        fetchRequest.predicate = predicate
        
        do {
            guard let result = try context.fetch(fetchRequest).first else {
                return NSManagedObject()
            }
            
            return result
        } catch  {
            print(error.localizedDescription)
            return NSManagedObject()
        }
    }
    
    static func hasObject(_ context: NSManagedObjectContext, of diary: DiaryModel) -> Bool {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        let predicate = NSPredicate(format: "id == %@", diary.id)
        fetchRequest.predicate = predicate
        
        do {
            return try !context.fetch(fetchRequest).isEmpty
        } catch {
            return false
        }
        
    }
    
    static func save(_ context: NSManagedObjectContext, _ diary: DiaryModel) -> Bool {
        let object = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context)
        object.setValue(diary.id, forKey: DiaryProperty.id)
        object.setValue(diary.videoURL, forKey: DiaryProperty.videoURL)
        object.setValue(diary.title, forKey: DiaryProperty.title)
        object.setValue(diary.body, forKey: DiaryProperty.body)
        object.setValue(diary.date, forKey: DiaryProperty.date)
        object.setValue(diary.fileName, forKey: DiaryProperty.fileName)
        
        do {
            try context.save()
            return true
        } catch {
            context.rollback()
            return false
        }
    }
    
    static func update(_ context: NSManagedObjectContext, _ diary: DiaryModel) -> Bool {
        let object = self.fetch(context, of: diary.id)
        object.setValue(diary.videoURL, forKey: DiaryProperty.videoURL)
        object.setValue(diary.title, forKey: DiaryProperty.title)
        object.setValue(diary.body, forKey: DiaryProperty.body)
        object.setValue(diary.date, forKey: DiaryProperty.date)
        
        do {
            try context.save()
            return true
        } catch {
            context.rollback()
            return false
        }
    }
    
    static func delete(_ context: NSManagedObjectContext, _ diary: DiaryModel) -> Bool {
        let object = self.fetch(context, of: diary.id)
        context.delete(object)
        
        do {
            try context.save()
            return true
        } catch {
            context.rollback()
            return false
        }
    }
    
    static func clearAllData(context: NSManagedObjectContext) -> Bool {
        let dataList = fetch(context)
        
        for object in dataList {
            context.delete(object)
        }
        
        do {
            try context.save()
            return true
        } catch {
            context.rollback()
            return false
        }
    }
}

fileprivate enum DiaryProperty {
    static let id = "id"
    static let videoURL = "videoURL"
    static let title = "title"
    static let body = "body"
    static let date = "date"
    static let fileName = "fileName"
}
