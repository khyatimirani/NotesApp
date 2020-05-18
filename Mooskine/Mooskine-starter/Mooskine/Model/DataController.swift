//
//  DataController.swift
//  Mooskine
//
//  Created by Khyati Mirani on 09/05/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import Foundation
import CoreData

class DataController {
    let persistentContainer : NSPersistentContainer
    
    var viewContext:NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(modelName:String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    func load(completion : (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            guard error == nil else {
                fatalError(error.debugDescription)
            }
            completion?()
        }
    }
}

extension DataController {
    func autoSaveviewContext(interval:TimeInterval = 30) {
        print("Auto saving")
        guard interval > 0 else {
            print("Error")
            return
        }
        if viewContext.hasChanges {
                 try? viewContext.save()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
                self.autoSaveviewContext(interval: interval)
            }
   
    }
}
