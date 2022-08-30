//
//  Diary_CoreDataClass.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/30.
//

import Foundation
import CoreData

@objc(DiaryMO)
public class DiaryMO: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<DiaryMO> {
        return NSFetchRequest<DiaryMO>(entityName: "Diary")
    }

    @NSManaged public var id: String
    @NSManaged public var videoURL: URL
    @NSManaged public var title: String
    @NSManaged public var body: String
    @NSManaged public var date: Date
}

extension DiaryMO : Identifiable {

}
