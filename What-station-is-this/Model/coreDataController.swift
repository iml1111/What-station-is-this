//
//  RecentSelectedItem.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/04/26.
//

import CoreData

struct coreDataController {
    static let shared = coreDataController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "What_station_is_this")
        container.loadPersistentStores { (storeDescrption, error) in
            if let error = error as NSError? {
                fatalError("에러 발생: \(error)")
            }
        }
    }
}
