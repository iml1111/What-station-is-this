//
//  RecentSelected+CoreDataProperties.swift
//  
//
//  Created by 신희재 on 2021/04/27.
//
//

import Foundation
import CoreData


extension RecentSelected {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecentSelected> {
        return NSFetchRequest<RecentSelected>(entityName: "RecentSelected")
    }

    @NSManaged public var date: Date?
    @NSManaged public var name: String?

}
