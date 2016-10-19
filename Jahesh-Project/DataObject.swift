//
//  DataObject.swift
//  RATreeViewExamples
//
//  Created by Rafal Augustyniak on 22/11/15.
//  Copyright © 2015 com.Augustyniak. All rights reserved.
//

import Foundation


class DataObject
{
    var name: String
    var id: Int
    var children : [DataObject]
    var haveChildren = false
    var isExpand = false

    init(name : String, id: Int, children: [DataObject]) {
        self.name = name
        self.id = id
        self.children = children
    }

    convenience init(name : String,  id: Int) {
        self.init(name: name, id: id, children: [DataObject]())
    }

    func addChild(child : DataObject) {
        self.children.append(child)
    }

    func removeChild(child : DataObject) {
        self.children = self.children.filter( {$0 !== child})
    }
}
