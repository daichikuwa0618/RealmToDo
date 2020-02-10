//
//  TodoModel.swift
//  RealmToDo
//
//  Created by Daichi Hayashi on 2020/02/10.
//  Copyright © 2020 Daichi Hayashi. All rights reserved.
//

import Foundation
import RealmSwift

class TodoModel: Object {
    @objc dynamic var items: String? = nil
}
