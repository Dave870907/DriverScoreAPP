//
//  ScoreRecord+CoreDataProperties.swift
//  project1
//
//  Created by 吳冠緯 on 2020/8/30.
//  Copyright © 2020 吳冠緯. All rights reserved.
//
//

import Foundation
import CoreData


extension ScoreRecord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScoreRecord> {
        return NSFetchRequest<ScoreRecord>(entityName: "ScoreRecord")
    }

    @NSManaged public var speed: String?
    @NSManaged public var date: String?
    @NSManaged public var time: String?

}
