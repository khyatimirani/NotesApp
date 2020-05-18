//
//  Note + Extension.swift
//  Mooskine
//
//  Created by Khyati Mirani on 11/05/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import Foundation
import CoreData

extension Note {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        creationDate = Date()
    }
}
