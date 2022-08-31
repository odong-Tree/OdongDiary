//
//  Diary+CoreDataClass.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/31.
//
//

import Foundation
import CoreData

@objc(Diary)
public class Diary: NSManagedObject {

}

extension Diary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Diary> {
        return NSFetchRequest<Diary>(entityName: "Diary")
    }

    @NSManaged public var title: String
    @NSManaged public var body: String
    @NSManaged public var videoURL: URL
    @NSManaged public var date: Date
    @NSManaged public var id: String
    @NSManaged public var fileName: String

}

extension Diary : Identifiable {

}
