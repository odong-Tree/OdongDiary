//
//  Diary_CoreDataClass.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/30.
//

import Foundation
import CoreData

@objc(Diary)
public class Diary: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Diary> {
        return NSFetchRequest<Diary>(entityName: "Diary")
    }

    @NSManaged public var videoURL: URL
    @NSManaged public var title: String
    @NSManaged public var body: String
    @NSManaged public var date: String
}

extension Diary : Identifiable {

}
