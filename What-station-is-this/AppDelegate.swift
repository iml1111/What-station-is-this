//
//  AppDelegate.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/14.
//

import UIKit
import CoreData
import BackgroundTasks


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var locationFetcher: LocationFetcher!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        locationFetcher = LocationFetcher()
        
        // 백그라운드 로케이션 스케쥴러 등록
        BGTaskScheduler.shared.register(
            forTaskWithIdentifier: "com.iml.What-station-is-this.LocationRefresh",
            using: DispatchQueue.global()) { task in
            self.locationRefresh(task: task as! BGAppRefreshTask)
        }
        
        // Fetch data once an hour.
        return true
    }
    
    func locationRefresh(task: BGAppRefreshTask) {
        simpleNotification(text: "HELLO", interval: 0.1)
        // 실제 작업
//        if self.locationFetcher.targetStation.name != unknownStation.name {
//            if self.locationFetcher.lastKnownStation.name != unknownStation.name {
//
//                let currentStationName = self.locationFetcher.lastKnownStation.name
//                if self.locationFetcher.nearestStations.contains(currentStationName) {
//                    simpleNotification(text: "도착역에 가까워졌어요!", interval: 0.1)
//                }
//            }
//        }
        
        task.expirationHandler = {
            print("스케쥴링 실패")
            task.setTaskCompleted(success: false)
        }
        task.setTaskCompleted(success: true)
        scheduleLocationRefresh()
    }
    
    func scheduleLocationRefresh() {
        // 다음 스케쥴을 예약하기 위한 함수
        let request = BGAppRefreshTaskRequest(identifier:"com.iml.What-station-is-this.LocationRefresh")
        request.earliestBeginDate = Date(timeIntervalSinceNow: 5)
        do {
            try BGTaskScheduler.shared.submit(request)
            print("스케쥴링 예약 완료")
        } catch { print("Could not schedule app refresh: \(error)") }
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "What_station_is_this")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
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
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

